class User < ActiveRecord::Base 
  has_secure_password
  has_many :vouchers


  validates :email, :password, presence: true, uniqueness: true
   
  
  
end