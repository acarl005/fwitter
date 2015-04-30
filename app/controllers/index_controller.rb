get '/' do
  "Hello World"
  "whattttt"
end

get '/users/:id' do
  #user homepage erb
end

get '/users/new' do
  #registration form erb
end

post '/users' do
  #create new user
  #redirect to /users/:id
end

get '/users/:id/edit' do
  #edit user profile
  #edit form erb
end

put '/users/:id' do
  #update user profile
  #redirect to get '/users/:id'
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
  #create a new tweet
  #redirect to users/:id
end

get '/users/:id/tweets/:id' do
  #display a single tweet & its attributes
end

delete '/users/:id/tweets/:id' do
  #delete specific tweet
end

post '/users/:id/relationships' do
  #create a follower relationship
end

delete '/users/:id/relationships/:id' do
  #destroy a follower relationship
end
