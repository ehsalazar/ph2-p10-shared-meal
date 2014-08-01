after do
  ActiveRecord::Base.connection.close
end

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

get '/users/all' do
  @users = User.all
  @meals = Meal.all
  erb :users_all
end

get '/users/:id' do
  @user = User.find_by_id(params[:id])
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
