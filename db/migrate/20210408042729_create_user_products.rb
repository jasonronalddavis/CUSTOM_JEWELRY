class CreateUserProducts < ActiveRecord::Migration
  def change
    create_table :user_products do |up|
      up.integer :user_id
      up.integer :product_id
      up.integer :product_storage_id
    end
  end
end