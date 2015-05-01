class Like < ActiveRecord::Base
  belongs_to(:liked_tweet, class_name: "Tweet", foreign_key: :tweet_id)
  belongs_to(:liker, class_name: "User", foreign_key: :user_id)
end
