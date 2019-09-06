class VouchersController < ApplicationController 

  get '/vouchers' do 
    @user = User.find(session[:user_id])
    erb :'vouchers/index'
    
  end 

  get '/vouchers/new' do 
    erb :'vouchers/new'
  end 

  post '/vouchers' do 
    @voucher = Voucher.create(store_name: params[:store_name], code: params[:code], savings: params[:savings], exp_date: params[:exp_date])

    redirect '/vouchers'
  end 
end 