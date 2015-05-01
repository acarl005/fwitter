require 'faker'
require 'gotfaker'


10.times do
  User.create(
    username: GOTFaker::Character.random_name,
    bio: GOTFaker::Quote.bad_ass,
    password: "corn",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
  )
end


tweets = [
    "This is a test tweet, yo",
    "this is yet another fake tweet, ugh",
    "I COULD DO THIS ALL DAY",
  ]

tweets.each do |tweet|
  Tweet.new(text: tweet)
end


