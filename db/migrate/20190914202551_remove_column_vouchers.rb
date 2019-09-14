class RemoveColumnVouchers < ActiveRecord::Migration
  def change
    remove_column :vouchers, :store_name
  end
end
