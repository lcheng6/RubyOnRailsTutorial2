class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  has_many :microposts
  validates(:name, presence: true, length: {minimum:3, maximum: 50})
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: true

  has_secure_password
  validates(:password, length: { minimum: 6} )
end
