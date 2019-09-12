class AddOptionToVoucher < ActiveRecord::Migration
  def change
    add_column :vouchers, :options, :string 
  end
end
