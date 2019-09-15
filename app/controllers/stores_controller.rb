class StoreController < ApplicationController 

  get '/stores' do 
    @store = Store.all
    erb :'/store/index'
  end 

  get '/store/new' do 
    erb :'/store/new'
  end 

  get '/stores/:id' do 
    if logged_in? 
      @store = Store.find(params[:id])
    else 
      redirect to '/login'
    end 
    erb :'/stores/show'
  end 

end 