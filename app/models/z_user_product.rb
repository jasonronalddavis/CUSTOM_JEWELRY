class UserProduct < ActiveRecord::Base
    belongs_to :user
    belongs_to :product
    belongs_to :product_storage
   extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
end