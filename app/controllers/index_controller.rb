# UNLESS LOGGED_IN? REDIRECT TO '/'!!! How?

# INDEX
  get '/' do
    if session[:id]
      redirect "/home"
    else
      erb :"index"
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

  # get '/signup' do
  #   erb :"index"
  # end

  post '/signup' do
    @user = User.new(
      username: params[:username],
      password: params[:password],
      bio:      params[:bio],
      photo_url: params[:photo_url],
      first_name: params[:first_name],
      last_name: params[:last_name],
      )
    if @user.save
      status 200
      session[:id] = @user.id
      # redirect "/users/#{params[:id]}"
      redirect "/home"
    else
      status 400
      erb :"index"
    end
  end

# USER INDEX
  get '/users' do
    @users = User.all
    @top_ten = @users
            .sort_by {|user| user.followers.count}
            .reverse!
            .first(10)
    erb :'users/index'
  end

# DIRECT TO PROFILE
  # THROUGH USER ID
  get '/users/:id' do
    @user = User.where(id: params[:id]).first
    if @user
      #show user profile
      erb :'users/profile'
    else
      status 404
      @error = "User does not exist"
      erb :'error'
    end
  end

  # THROUGH USERNAME
  get '/:username' do
    @user = User.where(username: params[:username]).first
    if @user
      erb :'users/profile'
    else
      status 404
      @error = "User does not exist"
      erb :'error'
    end
  end

# EDIT PROFILE
  # EDIT FORM
  get '/users/:id/edit' do
    erb :'users/edit'
  end

  # SUBMIT FORM
  put '/users/:id' do
    #update user profile
    redirect '/users/:id'
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
      session[:id] = @user.id
      redirect "/home"
    else
      status 400
      erb :"index"
    end
  end

# LOGOUT
  delete '/login' do
    session[:id] = nil
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
    User.find(params[:id]).tweets << @tweet
    redirect "/users/#{params[:id]}"
  end

# DISPLAY SINGLE TWEET
  get '/users/:id/tweets/:id' do
    #display a single tweet & its attributes
  end

# DELETE TWEET
  delete '/users/:id/tweets/:id' do
    #delete specific tweet
  end

  post '/likes' do
    @tweet = Tweet.where(id: params.keys.first).first
    @user = User.where(id: current_user).first
    if @tweet.likers << @user
      redirect("/#{@tweet.user.username}")
    else
      redirect('/')
    end
  end

  delete '/likes' do
    @tweet = Tweet.where(id: params.keys.last).first
    @user = User.where(id: current_user).first
    if @tweet.likers.delete(@user)
      redirect("/#{@tweet.user.username}")
    else
      redirect('/')
    end
  end
