# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker' 

City.destroy_all
User.destroy_all
Listing.destroy_all
Reservation.destroy_all


french_cities = [
  { name: "Paris", zip_code: "75000" },
  { name: "Marseille", zip_code: "13000" },
  { name: "Lyon", zip_code: "69000" },
  { name: "Bordeaux", zip_code: "33000" },
  { name: "Toulouse", zip_code: "31000" },
  { name: "Nice", zip_code: "06000" },
  { name: "Strasbourg", zip_code: "67000" },
  { name: "Lille", zip_code: "59000" },
  { name: "Nantes", zip_code: "44000" },
  { name: "Montpellier", zip_code: "34000" }
]

# Créez 10 villes à partir de la liste
french_cities.sample(10).each do |city_attrs|
  City.create(city_attrs)
end
puts "les 10 villes ont été créées"

# Créez 20 utilisateurs et affectez-les à l'une des villes existantes
20.times do
  user = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    phone_number: Faker::PhoneNumber.unique.phone_number,
    city: City.all.sample
  )
end
puts "les 20 users ont été créés"

#création des 50 listings
users = User.all
cities = City.all
50.times do
  listing = Listing.create(
    user: users.sample,
    city: cities.sample,
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    price: Faker::Number.between(from: 10, to: 1000),
    available_beds: Faker::Number.between(from: 1, to: 10),
    welcome_message: Faker::Lorem.sentence,
    has_wifi: [true, false].sample
  )
end

puts "Les 50 listings ont été créés."

#création des résa
users = User.all
listings = Listing.all

# Pour chaque listing
listings.each do |listing|

  #Réservations dans le passé

  5.times do
    reservation = Reservation.create(
      guest: User.all.sample, # Vous pouvez choisir un utilisateur aléatoire comme invité (guest)
      listing: listings.sample, #on prend un appart aléatoirement
      check_in: Faker::Date.between(from: 1.year.ago, to: 1.month.ago),
      check_out: Faker::Date.between(from: 1.month.ago, to: 1.day.ago)
    )
  end
 

  # Réservations dans le futur
  5.times do
    reservation = Reservation.create(
      guest: User.all.sample, # Vous pouvez choisir un utilisateur aléatoire comme invité (guest)
      listing: listings.sample, #on prend un appart aléatoirement
      check_in: Faker::Date.between(from: 1.month.from_now, to: 3.months.from_now),
      check_out: Faker::Date.between(from: 3.months.from_now, to: 6.months.from_now)
    )
  end
  

end


puts "les résa passées ont été créés"
puts "les résa futures ont été créés"