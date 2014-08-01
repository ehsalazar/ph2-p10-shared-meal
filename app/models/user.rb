class User < ActiveRecord::Base
  validates :email, uniqueness: true
  has_many :meals

  include BCrypt
  def password
    @password ||= Password.new(password_hash)
  end
  def password=(new_password)
    if new_password.length < 6
      self.errors.add(:password, "is invalid (minimum is 6 characters).")
    else
      @password = Password.create(new_password)
      self.password_hash = @password
    end
  end

end
