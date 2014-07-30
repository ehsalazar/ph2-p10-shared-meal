after do
  ActiveRecord::Base.connection.close
end


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

get '/users/all' do
  @users = User.all
  erb :users_all
end

get '/users/:id' do
  @user = User.find_by_id(params[:id])
  @meals = Meal.all
  erb :profile
end

get '/users/update/:id' do
  erb :update_profile
end

put '/users/:id' do
  user = User.find(session[:id])
  user.update_attributes(params[:user])
  redirect '/users/:id'
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

#----------- MEALS -----------

get '/meals/:id' do
  erb :meals
end

post '/meals/:id' do
  p session[:id]
  meal = Meal.create(params[:meal])
  meal.update_attributes(user_id: session[:id], active: true)
  redirect '/users/:id'
end
