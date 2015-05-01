class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :likers, through: :likes
  has_many :likes

  validates :text, length: { maximum: 150 }, presence: true
end
