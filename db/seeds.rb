require 'gotfaker'


10.times do
  User.create(username: GOTFaker::Character.random_name, bio: GOTFaker::Quote.bad_ass, password_hash: "$2a$10$.8JWsVv7tbVjU.Scnpsvs.o9pCRtgW5XtkdE6N475iqKiLRT3oFwe")
end


User.create(username: "Chad", password_hash: "$2a$10$.8JWsVv7tbVjU.Scnpsvs.o9pCRtgW5XtkdE6N475iqKiLRT3oFwe")



