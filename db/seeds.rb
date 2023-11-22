puts 'Cleaning User DataBase'
User.destroy_all

puts 'Cleaning Coffee DataBase'
Coffee.destroy_all

puts 'Creating users for you'

10.times do
  users = User.new({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123456789'
  })
  users.save!
  puts 'User created'

  puts 'Creating coffees'

  rand(1..5).times do
    coffee = Coffee.new({
      name: Faker::Coffee.blend_name,
      origin: Faker::Coffee.origin,
      strength: (1..5).to_a.sample,
      description: Faker::Coffee.notes,
      rating: Faker::Number.decimal(l_digits: 1, r_digits: 2)
    })
    coffee.user = users
    coffee.save!
    puts 'Coffee created'
  end
end

puts 'Finished creating coffees'
