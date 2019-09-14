class Store < ActiveRecord::Base
  has_many :vouchers
  has_many :users, through: :vouchers 

  #store_name, store_website
end 