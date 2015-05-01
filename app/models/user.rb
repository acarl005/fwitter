require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  def password
    @password ||= Password.new(password_hash) if password_hash
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  has_many :tweets

  has_many :followers, through: :i_am_a_followee_relationships
  has_many :followees, through: :i_am_a_follower_relationships

  has_many :i_am_a_follower_relationships,
            class_name: "Relationship",
            foreign_key: "follower_id"

  has_many :i_am_a_followee_relationships,
            class_name: "Relationship",
            foreign_key: "followee_id"

  validates :username, presence: true, uniqueness: true
  validates :password_hash, presence: true
  validates :photo_url, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
