class Attempt < AuthModel

  belongs_to :public_quiz, foreign_key: :quiz_id
  has_many :answers, dependent: :destroy

  def completed?
    result != 'N'
  end

  def get_score
    score = 0
    public_quiz.public_questions.each_with_index { |q,i|
      a = Answer.where(question_id: q.id).first

      if (a.alt_1 == q.check_1) &&
         (a.alt_2 == q.check_2) &&
         (a.alt_3 == q.check_3) &&
         (a.alt_4 == q.check_4) &&
         (a.alt_5 == q.check_5)
        score += q.points
      end
    }

    return score
  end

end
