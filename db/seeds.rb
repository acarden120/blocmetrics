# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
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
