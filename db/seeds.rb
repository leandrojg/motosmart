# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

30.times do |n|
  name = Faker::Name.unique.name
  email = Faker::Internet.unique.email
  password = Faker::Internet.password

  created_user = User.create(name: name, email: email, password: password)
  60.times do
    distance = Faker::Number.between(from: 1, to: 100)
    random_date = Faker::Time.between(from: 6.months.ago, to: DateTime.now, format: :default)
    Record.create(distance: distance, user_id: created_user.id, created_at: random_date, updated_at: random_date)
  end
end

User.create(name: 'motosmart', email: 'moto@smart.com', password: '123456')