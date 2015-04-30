require 'gotfaker'


10.times do
  User.create(username: GOTFaker::Character.random_name, bio: GOTFaker::Quote.bad_ass)
end



