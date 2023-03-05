FactoryBot.define do
  factory :history_shipping do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    building { Faker::Lorem.sentence }
    telephone { '0123456789' }
  end
end
