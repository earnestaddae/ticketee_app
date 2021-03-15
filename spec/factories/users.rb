FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "passme123" }

    trait :admin do
      admin { true }
    end
  end
end
