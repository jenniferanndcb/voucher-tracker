class VouchersController < ApplicationController 

  get '/vouchers' do 
    @user = User.find(session[:user_id])
    @user_vouchers = []

    Voucher.all.each do |voucher|
      @user_vouchers << voucher 
    end 

    erb :'vouchers/index'
    
  end 

  get '/vouchers/new' do 
    erb :'vouchers/new'
  end 

  post '/vouchers' do 
    @vouchers = Voucher.create(store_name: params[:store_name], code: params[:code], savings: params[:savings], exp_date: params[:exp_date])
    redirect '/vouchers'
  end 
end 