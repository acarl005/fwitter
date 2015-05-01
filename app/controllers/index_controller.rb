get '/home' do
  begin
    @user = User.find(current_user)
  rescue
    redirect "/"
  end
  # @user = User.where(id: params[:id]).first
  erb(:homepage)
end

get '/users/new' do
  #registration form erb
end

post '/users' do
  #create new user
  #redirect to /users/:id/home
end

get '/users/:id' do
  @user = User.where(id: params[:id]).first
  #show user profile
  erb :'users/profile'
end

get '/users/:id/edit' do
  #edit user profile
  #edit form erb
end


put '/users/:id' do
  #update user profile
  #redirect to get '/users/:id/home'
end

delete '/users/:id' do
  #delete profile
  #redirect to '/'
end

get '/users/:id/tweets' do
  #index all user's tweets
  #tweet index erb
end

post '/users/:id/tweets' do
  @tweet = Tweet.new(
    text: params[:tweet]
  )
  if User.find(params[:id]).tweets << @tweet
    redirect "/users/#{params[:id]}"
  else
    'you suck'
  end
end

get '/users/:id/tweets/:id' do
  #display a single tweet & its attributes
end

delete '/users/:id/tweets/:id' do
  #delete specific tweet
end

post '/users/:id/relationships' do
  User.find(params[:id]).followers << User.find(current_user)
  redirect "/users/#{params[:id]}"
end

delete '/users/:id/relationships' do
  User.find(params[:id]).followers.delete(User.find(current_user))
  redirect "/users/#{params[:id]}"
end
