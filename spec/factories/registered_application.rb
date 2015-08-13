FactoryGirl.define do
  factory :registered_application do
    user
    name 'TestApplication'
#    url 'http://www.google.com'
    sequence(:url) { |n| "http://www.example#{n}.com" }
  end
end