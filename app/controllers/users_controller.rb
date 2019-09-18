
class UsersController < ApplicationController

  get '/login' do 
    erb :'users/login'
  end 

  get '/signup' do 
    erb :'users/new'
  end 

  post '/login' do 
    if login(params[:email], params[:password])
      redirect '/vouchers'
    else 
      redirect '/login'
    end 
  end 
  
  post '/signup' do 
    @user = User.create(email: params[:email], first_name: params[:first_name], password: params[:password])

    redirect '/vouchers'
  end 

  get '/logout' do 
    logout! 
  end

end 