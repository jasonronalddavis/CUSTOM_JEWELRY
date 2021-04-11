class ProductStorage < ActiveRecord::Base
    has_many :user_products
    has_many :users, :through => :user_products
    has_many :products, :through => :user_products

    validates :product_name, :presence => true

   extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods

end