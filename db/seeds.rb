require 'faker'
require 'gotfaker'


erica = User.create(username: "coderica", first_name: "Erica", last_name: "Prenga", bio: GOTFaker::Quote.bad_ass, password: "popped")
chad = User.create(username: "Chad", first_name: "Chad", last_name: "Idontknow", bio: GOTFaker::Quote.bad_ass, password: "popped")
mark = User.create(username: "markiscool", first_name: "Mark", last_name: "Mcq", bio: GOTFaker::Quote.bad_ass, password: "popped")
andy = User.create(username: "andy", first_name: "Andy", last_name: "imnotsure", bio: GOTFaker::Quote.bad_ass, password: "popped")

tweets = [
    "This is a test tweet, yo",
    "this is yet another fake tweet, ugh",
    "I COULD DO THIS ALL DAY",
  ]

tweets.each do |tweet|
  erica.tweets << Tweet.new(text: tweet)
  andy.tweets << Tweet.new(text: tweet)
  mark.tweets << Tweet.new(text: tweet)
  chad.tweets << Tweet.new(text: tweet)
end


