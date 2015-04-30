def logged_in?
  !!current_user
end

def current_user
  session[:user_id]
end
