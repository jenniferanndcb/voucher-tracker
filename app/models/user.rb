class User < ActiveRecord::Base 
  has_secure_password
  validates :email, presence: true, uniqueness: true 
  validates_presence_of :password
  has_many :vouchers 

  def list_user_vouchers 
    self.vouchers.collect do |voucher| "#{voucher.code}" 
    end 
  end 

  
end