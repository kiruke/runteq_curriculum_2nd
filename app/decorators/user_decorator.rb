class UserDecorator < ApplicationDecorator
  delegate_all

  def full_name
  "#{first_name} #{last_name}" # object. を省略
  end

end
