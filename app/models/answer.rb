class Answer < AuthModel
  belongs_to :attempt
  belongs_to :question
end
