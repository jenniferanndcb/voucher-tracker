class CreateVoucher < ActiveRecord::Migration
  def change
    create_table :vouchers do |t|
      t.string :store_name
      t.string :code 
      t.integer :savings 
      t.date :exp_date 
      t.belongs_to :user 
    end 
  end
end
