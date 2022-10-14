class Seller < ApplicationRecord
    has_many :properties
    has_many :users, through: :properties

    # validates :name, presence: true
    # validates :email, uniqueness: true
end
