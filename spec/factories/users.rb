FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    sequence(:email) { |n| "example#{n}@example.com" }
    password { "aabbcc" }
    password_confirmation { "aabbcc" }
    introduction { "はじめまして！" }
  end
end
