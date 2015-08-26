require 'faker'

testuser = User.new(
  name:        'Test2 User2',
  email:       'test2@example.com',
  password:    'abc654321'
  )
testuser.skip_confirmation!
testuser.save!

testuser2 = User.new(
  name:        'Test3 User3',
  email:       'test3@example.com',
  password:    'abc654321'
  )
testuser2.skip_confirmation!
testuser2.save!

testuser3 = User.new(
  name:        'Test4 User4',
  email:       'test4@example.com',
  password:    'abc654321'
  )
testuser3.skip_confirmation!
testuser3.save!

testuser4 = User.new(
  name:        'Test5 User5',
  email:       'test5@example.com',
  password:    'abc654321'
  )
testuser4.skip_confirmation!
testuser4.save!

15.times do
  registered_application = RegisteredApplication.create!(
  user:        testuser,
  name:        Faker::App.name,
  url:         Faker::Internet.url
  )
end
registered_applications = RegisteredApplication.all

25.times do
  registered_application = RegisteredApplication.create!(
  user:        testuser2,
  name:        Faker::App.name,
  url:         Faker::Internet.url
  )
end
registered_applications = RegisteredApplication.all

20.times do 
  event = Event.create!(
  registered_application:        registered_applications.sample,
  name:                          Faker::Hacker.verb
  )
end
events = Event.all
 
puts "Seed finished"
puts "#{RegisteredApplication.count} applications created"
puts "#{Event.count} events created."
puts "#{User.count} users created."