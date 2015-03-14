# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email


projects = (1..10).collect do |i|
  Project.find_or_create_by(name: "Simple project nr #{i}")
end
 
project_person = ProjectPerson.find_or_create_by(user_id: user.id, project_id: projects.first.id)
 
branches = (1..10).collect do |i|
  Branch.create(name: "master", project_id: projects[i])
end
 
commits = (1..10).collect do |i|
  Commit.find_or_create_by(
    name: "Simple commit #{i}",
    hash_string: Digest::SHA256.hexdigest("Simple commit #{i}"),
    user_id: user.id,
    project_id: projects.first.id,
    branch_id: branches.first.id
  )
end
