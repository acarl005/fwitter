def logged_in?
  !!current_user
end

def current_user
  session[:id]
end
