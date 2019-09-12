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
    if logged_in?
      @vouchers = Voucher.create(store_name: params[:store_name],code: params[:code],savings: params[:savings],exp_date: params[:exp_date],user_id: current_user.id)
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

  patch '/vouchers/:id' do 
    redirect '/vouchers/id'
  end 

  delete '/vouchers/:id/delete' do 
    if logged_in?
      @voucher = Voucher.find(params[:id])
      if @voucher.user_id == current_user.id 
          @voucher.delete 
      end 
    end 
    redirect '/vouchers'
  end 
end 