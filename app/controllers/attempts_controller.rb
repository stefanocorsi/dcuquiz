class AttemptsController < ApplicationController

  include Wicked::Wizard

  before_action :setup_wizard
  prepend_before_action :set_steps

  def show

    session[:quiz_id] = nil if params[:init]
    @quiz = PublicQuiz.find(session[:quiz_id] || params[:quiz])

    @question_num = ["finish", "completed"].include?(step.to_s) ? @quiz.public_questions.count : step.to_s.split("_")[1].to_i
    question_prev = (step.to_s == "finish") ? @quiz.public_questions.count : @question_num - 1

    @question = @quiz.public_questions[@question_num - 1]
    @prev_question = @quiz.public_questions[question_prev - 1] if question_prev > 0
    session[:quiz_id] = @quiz.id

    if params[:init]
      @attempt = Attempt.new(time_started: Time.now, quiz_id: @quiz.id)
      @attempt.save!
      session[:attempt_id] = @attempt.id
    end

    @attempt = Attempt.find(session[:attempt_id])
    @answer = Answer.where(attempt_id: @attempt.id, question_id: @question.id).first
    if !@answer
      @answer = Answer.new(attempt_id: @attempt.id, question_id: @question.id)
      @answer.save!
    end
    @prev_answer = Answer.where(attempt_id: @attempt.id, question_id: @prev_question.id).first if @prev_question

    if @attempt.completed?
       redirect_to :root
       return
    end

    if (@prev_answer) && params[:answer] && !@attempt.completed?
      @prev_answer.alt_1 = params[:answer][:alt_1] || 0
      @prev_answer.alt_2 = params[:answer][:alt_2] || 0
      @prev_answer.alt_3 = params[:answer][:alt_3] || 0
      @prev_answer.alt_4 = params[:answer][:alt_4] || 0
      @prev_answer.alt_5 = params[:answer][:alt_5] || 0
      @prev_answer.save!
    end

    if step.to_s == "completed"
      @attempt.time_ended = Time.now
      @time_taken = ((@attempt.time_ended - @attempt.time_started) / 60).round
      @attempt.result = 'F' if (@time_taken > @quiz.allowed_time)
      @attempt.score = @attempt.get_score
      @attempt.result = 'F' if @attempt.score < @quiz.pass_threshold
      @attempt.result = 'P' if @attempt.score >= @quiz.pass_threshold
      @attempt.save!
    end

    options = { template: ["finish", "completed"].include?(step.to_s) ? "attempts/#{step.to_s}" : "attempts/step" }
    render_wizard(nil, options)
  end

private

  def set_steps
    @quiz = PublicQuiz.find(session[:quiz_id] || params[:quiz])
    self.steps = []
    (@quiz.public_questions.count).times do |s|
      self.steps.push("question_#{s + 1}".to_s)
    end

    self.steps.push(:finish)
    self.steps.push(:completed)
  end

end