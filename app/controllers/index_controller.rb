# INDEX
  get '/' do
    if session[:id]
      redirect "/home"
    else
      erb :"users/index"
    end
  end

# HOME PAGE
  get '/home' do
    begin
      @user = User.find(current_user)
    rescue
      redirect "/"
    end
    # @user = User.where(id: params[:id]).first
    erb(:homepage)
  end

# CREATE NEW USER
  # #register new user
  # get '/users/new' do
  #   #signup form erb
  # end

  # post '/users' do
  #   #redirect to /users/:id/home
  # end
  #^^restful route

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

# USER INDEX
  get '/users'

# DIRECT TO PROFILE
  # THROUGH USER ID
  get '/users/:id' do
    @user = User.where(id: params[:id]).first
    #show user profile
    erb :'users/profile'
  end

  # THROUGH USERNAME
  get '/:username' do
    @user = User.where(username: params[:username]).first
    erb :'users/profile'
  end

# EDIT PROFILE
  # EDIT FORM
  get '/users/:id/edit' do
    #edit form erb
  end

  # SUBMIT FORM
  put '/users/:id' do
    #update user profile
    #redirect to get '/users/:id/home'
  end

  # DELETE PROFILE
  delete '/users/:id' do
    #delete profile
    #redirect to '/'
  end

# LOGIN
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

# LOGOUT
  delete '/login' do
    session[:user_id] = nil
    redirect "/"
  end

# FOLLOW
  post '/users/:id/relationships' do
    User.find(params[:id]).followers << User.find(current_user)
    redirect "/users/#{params[:id]}"
  end

# UNFOLLOW
  delete '/users/:id/relationships' do
    User.find(params[:id]).followers.delete(User.find(current_user))
    redirect "/users/#{params[:id]}"
  end

# INDEX OF USER TWEETS
  get '/users/:id/tweets' do
    #tweet index erb
  end

# CREATE NEW TWEET
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

# DISPLAY SINGLE TWEET
  get '/users/:id/tweets/:id' do
    #display a single tweet & its attributes
  end

# DELETE TWEET
  delete '/users/:id/tweets/:id' do
    #delete specific tweet
  end
