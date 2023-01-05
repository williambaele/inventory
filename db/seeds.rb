# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Destroying data"
Item.destroy_all
name = [ "Nike Dunk", "Yeezy 350V2", "Jordan 1"]
sku = [ "DD1509-101", "DD3509-200"]


100.times do
  item = Item.create!(name: name.sample, sku: sku.sample)
  puts item.name
end
