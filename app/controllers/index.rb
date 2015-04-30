
get '/' do
  erb :"users/index"
end

post '/login' do
  @user = User.where(username: params[:username]).first
  if @user && @user.password == params[:password])
    session[:user_id] = @user.id
    redirect '/' #Will make this the users page probably.
  else
    status 400
    @failed_login = true
    erb :"users/index"
  end
end



  params[:username]
  params[:password]
end
