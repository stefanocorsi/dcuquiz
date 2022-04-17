class PublicQuestion < ApplicationRecord

  self.table_name = 'questions'

  belongs_to :public_quiz, foreign_key: :quiz_id
end
