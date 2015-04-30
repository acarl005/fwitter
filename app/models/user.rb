require 'bcrypt'


class User < ActiveRecord::Base
  has_many :tweets

  validates :username, presence: true
  validates :password_hash, presence: true

  include BCrypt

  def password
    @password ||= Password.new(password_hash) if password_hash #.present? ?
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end


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
end
