class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :reviews

  has_secure_password

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end

end
