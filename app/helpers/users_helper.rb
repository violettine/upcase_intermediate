module UsersHelper
  def follow_button(user)
    button_to 'follow', user_follow_path(user)
  end
end
