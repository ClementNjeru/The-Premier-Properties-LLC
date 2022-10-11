# This file should contain all the record creation needed to seed the database with its default values.
puts "Seeding the database..."
# using faker to generate fake data
# user data
5.times do
  User.create(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password_digest: Faker::Internet.password
  )
end

# property data
5.times do
    Property.create(
        image_url: Faker::LoremFlickr.image,
        name: Faker::Address.community,
        address: Faker::Address.street_address,
        description: Faker::Lorem.paragraph,
        price: Faker::Number.number(digits: 6)
    )
end

# seller data
5.times do 
    Seller.create(
        name: Faker::Name.name,
    )
end

puts "Done seeding the database!"


