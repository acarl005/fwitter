
get '/' do
  erb :"users/index"
end

post '/login' do

  params[:username]
  params[:password]
end
