class Attempt < AuthModel

  has_many :answers, dependent: :destroy

end
