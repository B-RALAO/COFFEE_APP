require 'open-uri'

puts 'Cleaning User DataBase'
User.destroy_all

puts 'Cleaning Coffee DataBase'
Coffee.destroy_all

puts 'Creating users for you'

images = [
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1700658194/coffees/ifv8iibg9gx2joztwn2i.jpg",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1700658194/coffees/bl165qtabauvysmenlfs.jpg",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1700658194/coffees/hie9jbgv0pwhmrivu7w7.jpg",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1700658194/coffees/ip5ylgndkmqcqrkq8uvv.jpg",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1700658194/coffees/boolyt3ytilerv04mdjq.jpg",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1700658194/coffees/yv7rszkvoujlw7mvjyhz.jpg",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1700658193/coffees/i5ayimsqukplicsvbs9l.jpg",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1700658193/coffees/jjaccaweeuhjws8ftakk.jpg",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1700658192/coffees/dwqsjb4rnkdhcxr7xecd.jpg",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1700658193/coffees/kibpwjdcqqml2hhk2en0.jpg",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1700658193/coffees/ttrbemhgccwwmjvnifu5.jpg",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1700658192/coffees/kzmneylckxzqxzsdqu2g.jpg",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1700658192/coffees/ligpmbznk6donkugixcs.jpg",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1700658192/coffees/jodvzvuxwfmgqeb3ktq9.jpg",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1700658191/coffees/ptybiutsu8c6oqil4mtb.jpg",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1700658192/coffees/vumdufpqta8jnurlfg40.jpg",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1700658191/coffees/hkwkq4chmgjzcutp8a3i.jpg",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1700658191/coffees/bqae1ihghstfr53aafi2.jpg",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1700658191/coffees/lcwkgp6qqnui76vyiavg.jpg",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1700658191/coffees/cdaushbbtjn7evuyuqfy.jpg"
]

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

  2.times do
    file = URI.open(images.pop)
    coffee = Coffee.new({
      name: Faker::Coffee.blend_name,
      origin: Faker::Coffee.origin,
      strength: (1..5).to_a.sample,
      description: Faker::Coffee.notes,
      rating: Faker::Number.decimal(l_digits: 1, r_digits: 2),
      price: Faker::Number.decimal(l_digits: 2),
      variety: Faker::Coffee.variety,
      intensifier: Faker::Coffee.intensifier,
      grind: Coffee::GRIND.sample
    })
    coffee.user = users
    coffee.photo.attach(io: file, filename: "coffee.jpeg", content_type: "image/jpeg")
    coffee.save!
    puts 'Coffee created'
  end
end

puts 'Finished creating coffees'
