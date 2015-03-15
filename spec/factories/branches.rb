FactoryGirl.define do
  factory :branch do
    name { Faker::Company.catch_phrase }
    hash_string { Faker::Lorem.characters(40) }
    user
  end

end
