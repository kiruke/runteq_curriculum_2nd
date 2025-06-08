class UserDecorator < ApplicationDecorator
  delegate_all

  def full_name
  "#{first_name} #{last_name}" # object. を省略狩野 object.first_name
  end

end
