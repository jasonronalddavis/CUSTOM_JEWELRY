class CreateUserProducts < ActiveRecord::Migration
  def change
    create_table :users_products do |t|
      t.integer :user_id
      t.integer :product_id
    end
  end
end
