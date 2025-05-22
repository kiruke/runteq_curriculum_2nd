#require './db/seeds/users'
#require './db/seeds/posts'

10.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'foobar',
    password_confirmation: 'foobar',
  )
end

10.times do |i|
  user = User.find(1+i)
  board = user.boards.create!(
    title: Faker::Book.title,
    body: Faker::Lorem.paragraph,
  )
end
