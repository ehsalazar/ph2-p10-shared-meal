get '/' do
 # render home page
 erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  erb :sign_in
end

post '/sessions' do
  # sign-in
  user = User.find_by_email(params[:email])
  if user.password == params[:password]
    session[:id] = user.id
    redirect '/users/:id'
  else
    redirect '/'
  end
end

get '/sessions/:id' do
  # sign-out -- invoked
  session.clear
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

get '/users/:id' do
  @user = User.find_by_id(params[:id])
  erb :profile
end

post '/users' do
  # sign-up a new user

  if params[:user][:password].length > 5
    user = User.create(params[:user])
    if user.valid?
      session[:id] = user.id
      redirect '/users/:id'
    else
      @errors = user.errors.full_messages
      redirect '/'
    end
  end
end
