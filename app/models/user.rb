class User < ActiveRecord::Base 
  has_secure_password
  has_many :vouchers 
  has_many :stores, through: :vouchers

  validates :email, :password, presence: true, uniqueness: true
   
end