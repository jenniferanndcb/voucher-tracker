class StoreController < ApplicationController 

  get '/stores' do 
    @store = Store.new(store_name: params[:store_name], store_url: params[:store_url]) 
  end 

end 