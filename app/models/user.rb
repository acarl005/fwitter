class User < ActiveRecord::Base
  has_many :tweets

  has_many :followers, through: :i_am_a_followee_relationships
  has_many :followees, through: :i_am_a_follower_relationships

  has_many :i_am_a_follower_relationships,
            class_name: "Relationship",
            foreign_key: "follower_id"

  has_many :i_am_a_followee_relationships,
            class_name: "Relationship",
            foreign_key: "followee_id"
end
