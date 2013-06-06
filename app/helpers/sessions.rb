helpers do

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def users_template
    if current_user
      :_display_users
    else
      :_no_users
    end
  end
end
