class AuthModel < ApplicationRecord
  self.abstract_class = true
  before_create :set_default_user

  default_scope { where("#{table_name()}.user_id = ?", User.current_user.id) }

  def set_default_user
    self.user_id = User.current_user.id
  end

end
