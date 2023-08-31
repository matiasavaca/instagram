# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all

puts "Creating users..."
User.create(email: "avaca.matias1@gmail.com", full_name: "matias avaca", username: "matiasavaca", password: "123456")

User.create(email: "agop123@gmail.com", full_name: "agop chorba", username: "powcito", password: "123456")


User.create(email: "carlos@gmail.com", full_name: "carlos avaca", username: "carlitos", password: "123456")


