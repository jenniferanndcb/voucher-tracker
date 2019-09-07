class VouchersController < ApplicationController 

  get '/vouchers' do 
    @user = User.find(session[:user_id])
    @user_vouchers = []

    Voucher.all.each do |voucher|
      @user_vouchers << voucher 
    end 

    erb :'vouchers/show'
    
  end 

  get '/vouchers/new' do 
    erb :'vouchers/new'
  end 

  post '/vouchers' do 
    @vouchers = Voucher.create(store_name: params[:store_name], code: params[:code], savings: params[:savings], exp_date: params[:exp_date])
    redirect '/vouchers'
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
      @id = @voucher.id 
    else 
      redirect to '/login'
    end 
    erb :'/vouchers/edit' 
  end 

  
end 