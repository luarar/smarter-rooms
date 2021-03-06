class User < ApplicationRecord

    has_many :bookings
    has_many :rooms, through: :bookings
    

    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 90 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, format: { with:   VALID_EMAIL_REGEX }
    validates :password, presence: true, length: { minimum: 8 }, allow_nil: true
    has_secure_password


    def is_admin?
        self.admin 
    end
    

end
