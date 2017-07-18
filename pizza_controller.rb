require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza.rb')

# (Route = path & method)
# Restful Route = path + method + action
# REST -> (RE)presentational (S)tate (T)ransfer 

# These 7 elements are required for RESTful

# each needs a specific path as well. e.g. /pizza/new for for NEW.

# INDEX - GET method

# NEW (form to fill in) - GET method

# CREATE - POST method

# SHOW (one order) - GET method

# EDIT (form to fill in) - GET method 

# UPDATE - PUT (POST must be used in HTML) method

# DESTROY - DELETE method


# INDEX
get '/pizzas' do
  @pizzas = Pizza.all
  erb(:index)
end

# NEW
get '/pizzas/new' do
  
  erb(:new)
end

# SHOW
get '/pizzas/:id' do
  # use the find method where the data passed in is params?
  @pizza = Pizza.find(params[:id])
   erb(:show)
end

# CREATE
post '/pizzas' do
  @pizza = Pizza.new( params )
    @pizza.save()
    erb( :create )
end

# EDIT
get '/pizzas/:id/edit' do
  @pizza = Pizza.find( params[:id] )
  erb(:edit)
end

# UPDATE
post '/pizza/:id' do
  Pizza.new( params ).update
  redirect to '/pizzas'
end

# DELETE
post '/pizzas/:id/delete' do # delete
  pizza = Pizza.find( params[:id] )
  pizza.delete()
  redirect to '/pizzas'
end