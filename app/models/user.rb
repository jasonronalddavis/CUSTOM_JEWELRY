class User < ActiveRecord::Base
    has_many :user_products
    has_many :products, :through => :user_products
    has_many :product_storages, :through => :user_products
    has_secure_password
    validates_presence_of :username, uniqueness: true

end