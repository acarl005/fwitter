
get '/' do
  erb :"users/index"
end

post '/login' do
  @user = User.where(username: params[:username]).first
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    redirect "/home" #Will make this the users page probably.
  else
    status 400
    erb :"users/index"
  end
end

delete '/login' do
  session.delete(:user_id)
  redirect "/"
end

get '/signup' do
  erb :"users/signup"
end


post '/signup' do
  @user = User.new(
    username: params[:username],
    password: params[:password],
    bio:      params[:bio],
    )
  if @user.save
    status 200
    session[:user_id] = @user_id
    # redirect "/users/#{params[:id]}"
    redirect "users/#{@user.id}"
  else
    status 400
    erb :"/users/signup"
  end
end

