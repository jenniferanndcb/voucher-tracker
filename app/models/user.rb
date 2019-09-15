class User < ActiveRecord::Base 
  has_secure_password
<<<<<<< HEAD
  has_many :vouchers 
  has_many :stores, through: :vouchers

  validates :email, :password, presence: true, uniqueness: true
   
=======
  validates :email, presence: true, uniqueness: true 
  validates_presence_of :password
  has_many :vouchers 
  
>>>>>>> d3f3c25c88808a4905bb00e95172ea1a06aae95a
end