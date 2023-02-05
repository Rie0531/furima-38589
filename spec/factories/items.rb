FactoryBot.define do
  factory :item do
    association :user

    name { Faker::Lorem.sentence }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    explanation { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    postagetype_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    preparationday_id { Faker::Number.between(from: 2, to: 4) }
  end
end
