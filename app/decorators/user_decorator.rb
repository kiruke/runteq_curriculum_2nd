class UserDecorator < ApplicationDecorator
  delegate_all

  def full_name
    "#{last_name} #{first_name}" # object. を省略:w
  end

end
