require 'bcrypt'


class User < ActiveRecord::Base

  validates :username, presence: true
  validates :password, presence: true #password_hash instead?

  include BCrypt

  def password
    @password ||= Password.new(password_hash) if password_hash
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
