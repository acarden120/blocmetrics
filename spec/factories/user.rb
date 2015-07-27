FactoryGirl.define do
  factory :user do
    name 'Test3 User3'
    email 'test3@example.com'
    password 'abc333333'
    password_confirmation 'abc333333'
    confirmed_at Time.zone.now
  end
end
