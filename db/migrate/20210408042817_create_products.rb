class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |product|
      product.string :product_name
      product.string :alloy
      product.float :size
      product.string :gemstone
      product.integer :user_id
     product.integer :product_storage_id
    end
  end
end
