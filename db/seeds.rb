# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(name: "Michelle Fake", email: "fakeemail@email.com", password: "abcd12345")
user2 = User.create(name: "Derryl Jones", email: "so_fake_email@email.com", password: "abcde12345")
rest1 = Rest.create(name: "Noodles for Hire", address: "1 N Michigan Ave. Chicago IL", description: "Noodles and sundry!", phone: "555-555-5555")
rest2 = Rest.create(name: "Ooodles o' Noodles", address: "45 W Chicago Ave. Chicago IL", description: "Better than other Noodles!", phone: "555-777-7777")
reservation1 = Reservation.create(time: Time.now.to_datetime, user_id: user1.id, rest_id: rest1.id, name: user1.name)
reservation2 = Reservation.create(time: Time.now.to_datetime, user_id: user2.id, rest_id: rest1.id, name: user2.name)
owner1 = Owner.create(username: "Noodle_Owner22", password: "abcde12345", email: "fake_owneremail@example.com", first_name: "Joanna", last_name: "Rico")
restowner1 = owner1.rest_owners.create(rest_id: rest1.id, owner_id: owner1.id)