class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |product|
      product.string :name
      product.string :alloy
      product.float :size
      product.string :gemstone
      product.string :type
    end
  end
end
