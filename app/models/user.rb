class User < ApplicationRecord
    has_many :votes
    validates :email, presence: true, uniqueness:true
    has_secure_password
end
