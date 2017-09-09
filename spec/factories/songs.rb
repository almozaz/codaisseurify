FactoryGirl.define do
  factory :song do
    name { Faker::Lovecraft.tome }
  end
end
