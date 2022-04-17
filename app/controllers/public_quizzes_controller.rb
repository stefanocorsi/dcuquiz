class PublicQuizzesController < ApplicationController

   before_action :authenticate_user!

  def index
    @quizzes = PublicQuiz.all
  end

end
