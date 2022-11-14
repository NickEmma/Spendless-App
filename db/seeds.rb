# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
emma = User.create(name: 'Techie Emma', email: 'techieemma548@gmail.com', password: 123456)

(1..30).each do |i|
  Group.create(name: "Company ##{i}", icon: "https://cdn-icons-png.flaticon.com/512/2991/2991148.png", user: emma)
end

(1..100).each do |i|
  Operation.create(name: "Transaction ##{i}", amount: rand(1..10000), user: emma)
end

(1..100).each do
  MoneyGroup.create(operation: Operation.find(rand(1..100)), group: Group.find(rand(1..30)))
end
