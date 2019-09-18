class StoresController < ApplicationController 

  get '/stores' do 
    @stores = Store.all
    erb :'/stores/index'
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

  delete '/stores/:id/delete' do  
    @store = Store.find(params[:id]) 
    @store.delete  
    redirect '/stores'
  end

end 