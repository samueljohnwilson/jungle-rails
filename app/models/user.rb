class User < ActiveRecord::Base

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :password, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  has_many :reviews

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.strip.downcase)
    if (user)
      user.authenticate(password)
    end
  end

end
