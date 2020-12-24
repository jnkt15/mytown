FactoryBot.define do
  factory :post do
    name { Faker::Food.dish }
    description { "説明です" }
    reference { "https://goo.gl/maps/xEHCZp75BJdGCK4r5" }
    association :user
    created_at { Time.current }
  end

  trait :yesterday do
    created_at { 1.day.ago }
  end

  trait :one_week_ago do
    created_at { 1.week.ago }
  end

  trait :one_month_ago do
    created_at { 1.month.ago }
  end
end
