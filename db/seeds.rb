require 'json'
require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Board.destroy_all
Booking.destroy_all

@user = User.create(email:"test@gmail.com", password: "123456")
Board.create(user_id:@user.id, description:"The Duende model is an interpretation of a classic pig model originally created in the early 60’s. It is a playful board with a lot of volume around the stringer with a D fin, and foiled from the nose to the tail. It is only shaped in high density foam, allowing for weight and momentum.")
