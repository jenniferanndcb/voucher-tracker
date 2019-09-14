class VoucherAddBelongsTo < ActiveRecord::Migration
  def change
    add_belongs_to :vouchers, :store 
  end
end
