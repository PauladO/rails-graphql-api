# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

author1 = Author.create(first_name: 'Tom', last_name: 'Coleman')
author2 = Author.create(first_name: 'Sashko', last_name: 'Stubailo')
author3 = Author.create(first_name: 'Mikhail', last_name: 'Novikov')


Post.create(author: author1, title: 'Introduction to GraphQL', votes: 2)
Post.create(author: author2, title: 'Welcome to Meteor', votes: 3)
Post.create(author: author2, title: 'Advanced GraphQL', votes: 1)
Post.create(author: author3, title: 'Launchpad is Cool', votes: 7)
