class Relationship < ActiveRecord::Base
  has_one :follower, {class_name: "User"}
  has_one :followee, {class_name: "User"}

  validates :follower, {presence: true}
  validates :followee, {presence: true}
  validates_uniqueness_of :follower, scope: :followee
end
