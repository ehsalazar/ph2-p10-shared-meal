# after do
#   ActiveRecord::Base.connection.close
# end


get '/' do
 # render home page
 @meals = Meal.all
 erb :index
end

#----------- SESSIONS -----------



#----------- USERS -----------



#----------- MEALS -----------

