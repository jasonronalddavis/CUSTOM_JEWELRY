class Product < ActiveRecord::Base
    has_many :user_products
    has_many :users, :through => :user_products
    has_many :product_storages, :through => :user_products
   extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods

end