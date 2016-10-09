# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
[:admin, :gymleader, :trainer].each do |role|
  Role.where({ name: role }, without_protection: true).first_or_create
end

25.times do
  Pokemon.create(
    name: Faker::Pokemon.name,
    cp: Random.rand(200),
    user_id: 1+Random.rand(25)
  )
end

25.times do
  user_name = Faker::Name.name
  User.create(
    name: user_name,
    email: Faker::Internet.free_email(user_name),
    password: '12341234',
    password_confirmation: '12341234'
  )
end

