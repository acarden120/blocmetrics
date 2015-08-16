FactoryGirl.define do
  factory :registered_application do
    user
    name 'TestApplication'
    sequence(:url) { |n| "http://www.example#{n}.com" }
  end
end
