get '/sessions/new' do
  # render sign-in page
  erb :sign_in
end

post '/sessions' do
  # sign-in
  user = User.find_by_email(params[:email])
  if user.password == params[:password]
    session[:id] = user.id
  end
  redirect '/'
end

get '/sessions/:id' do
  # sign-out -- invoked
  session.clear
  redirect '/'
end
