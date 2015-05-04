FactoryGirl.define do
  factory :author do
    first_name    { Faker::Name.first_name }
    last_name     { Faker::Name.last_name }
    email_address { Faker::Internet.email }
  end
end
