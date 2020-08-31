module ApplicationHelper
  def user_email(user)
    user == current_user ? 'You' : user.email
  end
end
