User.create(name: "Admin", email: "admin@gmail.com", password: "123456")

20.times do
  Client.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    address: Faker::Address.full_address,
    phone: Faker::PhoneNumber.cell_phone,
    store_id: 1
  )

  Product.create(
    code: Faker::Barcode.ean,
    name: Faker::Commerce.product_name,
    description: Faker::Commerce.department(max: 5),
    price: Faker::Commerce.price(range: 0..10.0, as_string: true),
    quantity: Faker::Number.between(from: 1, to: 100),
    store_id: 1
  )

  Sale.create(
    quantity: Faker::Number.between(from: 1, to: 15),
    discount: Faker::Number.between(from: 1, to: 50),
    selling_price: Faker::Commerce.price(range: 0..10.0, as_string: true),
    product: Product.last,
    client: Client.last
  )
end
