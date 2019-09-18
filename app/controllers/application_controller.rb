require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, "secret" 
  end

  get "/" do
    if logged_in? 
      redirect '/vouchers'
    else 
    erb :index
    end 
  end

  helpers do 
    def logged_in? 
      !!session[:user_id]
    end 

    def current_user
      User.find(session[:user_id])
    end 

    def login(email,password)
    user = User.find_by(:email => email)
      if user && user.authenticate(password)
        session[:user_id] = user.id 
      else 
        redirect '/login'
      end 
    end


    def logout! 
      session.clear 
      redirect '/login'
    end 
  end 

end
