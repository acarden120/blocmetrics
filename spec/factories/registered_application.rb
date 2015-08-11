FactoryGirl.define do
  factory :registered_application do
    user User.first
    name 'TestApplication'
    email 'http://www.google.com'
  end
end