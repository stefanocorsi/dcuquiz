class Answer < AuthModel
  belongs_to :attempt
  belongs_to :public_question, optional: true
end
