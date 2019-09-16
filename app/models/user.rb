class User < ActiveRecord::Base 
  has_secure_password
  validates :email, presence: true, uniqueness: true 
  validates_presence_of :password
  has_many :vouchers 

  def save_voucher(id)
    current_user.vouchers << Voucher.find()
  end 

  
end