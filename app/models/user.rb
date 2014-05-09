class User < ActiveRecord::Base
  before_save { email.downcase! }
  before_create :create_remember_token

  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy

  validates(:name, presence: true, length: {minimum:3, maximum: 50})
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  validates(:password, length: { minimum: 6} )
  has_secure_password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def feed
    #This is preliminary.  Just the current user's messages
    Micropost.where("user_id = ?", id)
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      #Create the token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
