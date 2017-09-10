FactoryGirl.define do
  factory :song do
    name { Faker::Cat.breed }
  end
end
