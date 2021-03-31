class User < ActiveRecord::Base
    has_many :products
    has_secure_password
    validates_presence_of :username, uniqueness: true
    serialize :userproducts, Array

end