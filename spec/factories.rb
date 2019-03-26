# frozen_string_literal: true

FactoryBot.define do
  factory :hero do
    overwatch_id { Faker::Number.between(1, 10) }
    name { Faker::Name.name }
    real_name { Faker::Name.name }
    health { Faker::Number.between(1, 100) }
    armour { Faker::Number.between(1, 100) }
    shield { Faker::Number.between(1, 100) }
  end

  factory :ability do
    overwatch_id { Faker::Number.between(1, 10) }
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    is_ultimate { Faker::Boolean.boolean }
  end
end
