class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 5 }, presence: true
  validates :password_confirmation, presence: true

  # Class method for authenticating users based on email and password
  def self.authenticate_with_credentials(email, password)
    user = find_by(email: email.strip.downcase)
    return nil unless user&.authenticate(password)

    user
  end

end
