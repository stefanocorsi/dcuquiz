class PublicQuiz < ApplicationRecord
  self.table_name = 'quizzes'

  has_many :public_questions, foreign_key: :quiz_id
end
