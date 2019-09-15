class VouchersController < ApplicationController 

  get '/vouchers' do 
    @user = User.find(session[:user_id])
    @stores = Store.all

    erb :'vouchers/index'
    
  end 

  get '/vouchers/new' do 
    erb :'vouchers/new'
  end 

  post '/vouchers' do 
    if logged_in?
      @store = Store.create(store_name: params[:store_name], store_url: params[:store_url])
        
      @store.vouchers << Voucher.create(code: params[:code],savings: params[:savings],options: params[:options], exp_date: params[:exp_date],user_id: current_user.id)
     
      redirect '/vouchers'
    else
      redirect '/login'
    end
  end 

  get '/vouchers/:id' do 
    if logged_in? 
      @voucher = Voucher.find(params[:id])
    else 
      redirect to '/login'
    end 
    erb :'/vouchers/show'
  end 

  get '/vouchers/:id/edit' do 
    if logged_in? 
      @voucher = Voucher.find(params[:id])
    else 
      redirect to '/login'
    end 
    erb :'/vouchers/edit' 
  end 

  patch '/vouchers/:id/edit' do 
    @voucher = Voucher.find(params[:id])
    @voucher.store_name = params[:store_name]
    @voucher.code = params[:code]
    @voucher.savings = params[:savings]
    @voucher.exp_date = params[:exp_date]
    @voucher.options = params[:options]
    @voucher.save 
    redirect "/vouchers/#{@voucher.id}"
  end 

  delete '/vouchers/:id/delete' do 
    @voucher = Voucher.find(params[:id]) 
    @voucher.delete
    redirect '/vouchers'
  end 

end 