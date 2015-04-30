
get '/' do
  erb :"users/index"
end

post '/login' do
  @user = User.where(username: params[:username]).first
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    redirect "users/#{@user.id}" #Will make this the users page probably.
  else
    status 400
    erb :"users/index"
  end
end

get '/signup' do
  erb :signup
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
    redirect "/users/:id"
  else
    status 400
    erb :"/users/signup"
  end
end

get '/users/:id' do
  @user = User.where(id: params[:id]).first
  erb :"users/show"
end

