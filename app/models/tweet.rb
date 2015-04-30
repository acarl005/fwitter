class Tweet < ActiveRecord::Base
  belongs_to :user

  validates :text, length: { maximum: 150 }
end
