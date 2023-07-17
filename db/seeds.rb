require 'faker'

# User.create!(email: "test@gmail.com", password: "123456", password_confirmation: "123456")
20.times do
  name = Faker::Commerce.product_name
  quantity = rand(1..5)
  description = Faker::Lorem.sentence(word_count: 10)
  price = rand(10.0..100.0).round(2)
  image_url = "https://source.unsplash.com/300x200/?#{name}"

  Product.create!(
    product_name: name,
    product_quantity: quantity,
    description: description,
    price: price,
    product_image: image_url
  )
end