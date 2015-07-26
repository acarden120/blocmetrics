# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:

require 'faker'

# Create an admin user
admin = User.new(
 name:     'Admin User',
 email:    'admin2@example.com',
 password: 'helloworld',
)
admin.skip_confirmation!
admin.save!

# Create an standard test user
admin = User.new(
 name:     'Test User',
 email:    'test@example.com',
 password: 'abc123456',
)
admin.skip_confirmation!
admin.save!


# Create an standard test user
admin = User.new(
 name:     'Test2 User2',
 email:    'test2@example.com',
 password: 'abc654321',
)
admin.skip_confirmation!
admin.save!


# Added 26th July, 2015
# Create Users
5.times do
  user = User.new(
  name:        Faker::Name.name,
  email:       Faker::Internet.email,
  password:    Faker::Lorem.characters(10)
  ) 
user.skip_confirmation!
user.save!
end  
users = User.all

# Create a member
member = User.new(
  name:        'Member2 User2',
  email:       'member2@example.com',
  password:    'helloworld'
  )
member.skip_confirmation!
member.save!

# Create registered applications
example_app = RegisteredApplication.create!(
  name:        'Example Name',
  url:         'http://example.com'
  )
example_app.save!

5.times do
  registered_application = RegisteredApplication.create!(
  name:        Faker::App.name,
  url:         Faker::Internet.url
  )
end
registered_applications = RegisteredApplication.all

# Create events
example_event = Event.create!(
  registered_application:        example_app,
  name:                          'view'
  )
example_event.save!
