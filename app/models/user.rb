class User < ApplicationRecord
    has_many :votes
    validates :email, presence: true, uniqueness:true
    validates :name,presence: true,length: { maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email,presence: true,length: { maximum: 255}
    validates :password,presence: true,length: { minimum: 6}
    has_secure_password

end
