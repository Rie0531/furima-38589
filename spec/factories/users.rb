FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { "1a#{Faker::Internet.password(min_length: 6)}" }
    password_confirmation { password }
    last_name             { person.last.kanji }
    first_name            { person.first.kanji }
    read_last             { person.last.katakana }
    read_first            { person.first.katakana }
    birthday              { Faker::Date.birthday }
  end
end
