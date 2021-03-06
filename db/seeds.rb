# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Creating 10 fake restaurants...'
10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
  )
  user.save!
  restaurant = Restaurant.new(
    user_id: user.id,
    name:    Faker::Restaurant.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
  )
  restaurant.save!
  comment = Comment.new(
    content: Faker::Restaurant.review,
    user_id: user.id,
    restaurant_id: restaurant.id,
  )
  comment.save!
end
puts 'Finished!'