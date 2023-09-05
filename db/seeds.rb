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

User.create(email: "belen@gmail.com", full_name: "belen avaca", username: "beluavaca", password: "123456")

User.create(email: "cecilia@gmail.com", full_name: "cecilia avaca", username: "ceciturano", password: "123456")

User.create(email: "nico@gmail.com", full_name: "nico repetto", username: "nicorepetto", password: "123456")

User.create(email: "fran@gmail.com", full_name: "fran muslera", username: "franm43", password: "123456")
