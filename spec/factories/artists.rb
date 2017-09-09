FactoryGirl.define do
  factory :artist do
    name { Faker::Lovecraft.deity  }
    description { Faker::Lovecraft.fhtagn(3) }
  end
end
