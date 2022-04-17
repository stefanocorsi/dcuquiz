class Quiz < AuthModel
  validates :name,  :presence => true
  validates :pass_threshold,  :presence => true
  has_many :questions, dependent: :destroy
end
