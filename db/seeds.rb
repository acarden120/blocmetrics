require 'faker'

testuser = User.new(
  name:        'Test2 User2',
  email:       'test2@example.com',
  password:    'abc654321'
  )
testuser.skip_confirmation!
testuser.save!

15.times do
  registered_application = RegisteredApplication.create!(
  user:        testuser,
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