class Relationship < ActiveRecord::Base

 	# MARK'S
  belongs_to :follower, :class_name => "User"
  belongs_to :followee, :class_name => "User"
  # ----------------


  # belongs_to :follower, {class_name: "User"}
  # belongs_to :followee, {class_name: "User"}

  validates :follower, {presence: true}
  validates :followee, {presence: true}
  validates_uniqueness_of :follower, scope: :followee
end
