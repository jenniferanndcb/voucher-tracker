
class UsersController < ApplicationController

  get '/login' do 
    if logged_in? 
      redirect to '/vouchers'   
    else 
      erb :'users/login'
    end 
  end 

  get '/signup' do 
    if !logged_in? 
      erb :'users/new'
    else 
      redirect to '/vouchers'
    end 
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
      session[:user_id] = @user.id 
      redirect '/vouchers'
  end 

  get '/logout' do 
    logout! 
  end

end 