class VouchersController < ApplicationController 

  get '/vouchers' do 

    erb :'vouchers/index'
    
  end 

  get '/vouchers/new' do 
    erb :'vouchers/new'
  end 

  post '/vouchers' do 
    @voucher = Voucher.create(params)

    redirect '/vouchers'
  end 
end 