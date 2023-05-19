# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
20.times do
  Client.create(name: Faker::Name.name, email: Faker::Internet.email, address: Faker::Address.full_address, phone: Faker::PhoneNumber.cell_phone, store_id: 1)
end

20.times do
  Product.create(name: Faker::Commerce.product_name, description: Faker::Commerce.department(max: 5), price: Faker::Commerce.price(range: 0..10.0, as_string: true), quantity: Faker::Number.between(from: 1, to: 100), store_id: 1)
end
