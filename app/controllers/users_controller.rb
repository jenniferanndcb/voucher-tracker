class UsersController < ApplicationController

  get '/login' do 
    erb :'users/login'
  end 

  get '/signup' do 
    erb :'users/new'
  end 

  post '/signup' do 
    
  end 

end 