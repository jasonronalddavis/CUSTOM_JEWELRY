class CreateProductStorage < ActiveRecord::Migration
  def change
    create_table :product_storages do |ps|
      ps.string :product_name
      ps.string :alloy
      ps.float :size
      ps.string :gemstone
      ps.integer :user_id
      ps.integer :product_id
    end
  end
end
