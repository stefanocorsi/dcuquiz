# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create({id: 1, email: "stefano.corsi@gmail.com", password: "test123", role: 2})
user = User.create({id: 2, email: "scorsi@floo.it", password: "test123", role: 2})
user = User.create({id: 3, email: "stefano@quovai.com", password: "test567", role: 1})

2.times do |u|

  User.current_user = User.find(u + 1)
  10.times do
    quiz = Quiz.new
    quiz.name = Faker::TvShows::Simpsons.quote
    quiz.pass_threshold = rand(40...100)
    quiz.save!

    10.times do |i|
      question = Question.new
      question.quiz_id = quiz.id
      question.points = rand(1...10)
      question.sort_order = (i + 1) * 10
      question.question_text = Faker::Lorem.sentence(word_count: 12, supplemental: true, random_words_to_add: 5)
      question.alt_1 = Faker::Game.genre
      question.check_1 = rand(0..1)
      question.alt_2 = Faker::Game.genre
      question.check_2 = rand(0..1)
      question.alt_3 = Faker::Game.genre
      question.check_3 = rand(0..1)
      question.alt_4 = Faker::Game.genre
      question.check_4 = rand(0..1)
      question.alt_5 = Faker::Game.genre
      question.check_5 = rand(0..1)
      question.save!
    end
  end
end
