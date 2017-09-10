FactoryGirl.define do
  factory :artist do
    name { Faker::RockBand.name  }
    description { Faker::Hipster.sentence(4) }
  end
end
