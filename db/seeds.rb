# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Restaurant.destroy_all
puts "Database is now clean..."
puts "Creating restaurants..."
100.times do
  Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    rating: rand(1..5),
    chef_name: Faker::FunnyName.name
  )
end
puts "Seeding finished..."
puts "Restaurant with lowest id: #{Restaurant.first.id}"
puts "Restaurant with highest id: #{Restaurant.last.id}"
