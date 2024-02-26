# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    industry { Faker::Company.industry }
    employee_count { Faker::Number.between(from: 1, to: 5000) }
  end
end
