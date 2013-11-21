# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

params = {
  email: "test@mconf.org",
  name: "Test User",
  username: "test",
  password: "test"
}
u = User.create(params)
u.save!
puts "Created user: #{u.inspect}"
