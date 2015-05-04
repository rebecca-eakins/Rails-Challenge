FactoryGirl.define do
  factory :tag do
    name       { Faker::Lorem.words(3).join(' ').titleize }
    short_name ''
  end
end
