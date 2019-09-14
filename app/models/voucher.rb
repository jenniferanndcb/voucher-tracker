class Voucher < ActiveRecord::Base 
  belongs_to :users 
  belongs_to :stores

end 