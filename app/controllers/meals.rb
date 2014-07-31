get '/meals/:id' do
  erb :meals
end

post '/meals/:id' do
  p session[:id]
  meal = Meal.create(params[:meal])
  meal.update_attributes(user_id: session[:id], active: true)
  redirect '/'
end
