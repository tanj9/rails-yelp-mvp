# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'starting seed...'

puts 'Cleaning database...'
Restaurant.destroy_all
Review.destroy_all

puts 'Creating restaurants and reviews...'
10.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: Restaurant::CATEGORIES.sample
  )
  restaurant.save!
  puts "Created #{restaurant.name}"
  rand(3..17).times do
    review = Review.new(
      rating: rand(0..5),
      content: Faker::Restaurant.review,
      restaurant_id: restaurant.id
    )
    review.save!
  end
  puts "Created #{restaurant.reviews.count} reviews for #{restaurant.name}"
end

puts 'Done seeding!'
