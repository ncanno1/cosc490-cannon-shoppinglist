# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Item.delete_all
List.delete_all

List.create(title: "Grocery")

eggs = Item.create(name: "Eggs")
beer = Item.create(name: "Beer")
diapers = Item.create(name: "Diapers")

l = List.first

l.items << eggs
l.items << beer
l.items << diapers
