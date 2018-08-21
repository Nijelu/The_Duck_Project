# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
Duck.create(
  title: "canard#{i + 1}",
  description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  price_per_day: i * 23,
  address: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  lat: 42.42,
  lng: 42.42,
  country: 'Georgia',
  city: 'Tibilissi',
  postal_code: '78230',
  user: User.all.first
  )
end
