class Store < ActiveRecord::Base
  has_many :vouchers, dependent: :destroy
  has_many :users, through: :vouchers 
  validates_uniqueness_of :store_name

end 