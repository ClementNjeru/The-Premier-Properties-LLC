class User < ApplicationRecord
    belongs_to :seller
    belongs_to :property

    validates :username, presence: true
    validates :email, uniqueness: true
end
