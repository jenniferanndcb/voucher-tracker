class CreateStore < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :store_name 
      t.string :store_url
    end 
  end
end
