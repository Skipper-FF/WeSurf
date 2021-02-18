require 'open-uri'
require 'nokogiri'
require 'faker'
require "yaml"

puts "Destroying all instances"
Board.destroy_all
User.destroy_all

design = 'el-duende'
url = "https://www.naje-surfboards.net"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.css('li.folder-collection.folder div.subnav li.page-collection a').each do |a|
  url_design = "https://www.naje-surfboards.net#{a.attribute('href')}"
  html_file_design = open(url_design).read
  html_doc_design = Nokogiri::HTML(html_file_design)

  image_url = html_doc_design.at('.image-inset img').attribute('src').value

  name = html_doc_design.at('.image-title p').text

  description = html_doc_design.at('.image-subtitle p').text

  category = ["longboard", "shortboard", "hybride", "fish", "gun", "foam", "mini malibu"].sample

  location = ["Biarritz", "Hossegor", "Lacanau"].sample

  price = rand(10..40)

  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  password = "123456"

  user = User.create!(first_name: first_name, last_name: last_name, email: email, password: password)

  file = URI.open(image_url)

  board = Board.new(name: name, description: description, category: category, price: price, user_id: user.id, location: location)
  board.photo.attach(io: file, filename: "surf")
  board.save
  puts "board.save"

sleep(7)

end

puts "#{User.all.length} users created"
puts "#{Board.all.length} boards created"


# board image to do after cloudinary setup
# image_url = html_doc.at('.image-inset img').attribute('src').value
