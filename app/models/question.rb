class Question < AuthModel
  validates :question_text,  :presence => true
  validates :points,  :presence => true
  belongs_to :quiz
end
