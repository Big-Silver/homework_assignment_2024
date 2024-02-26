# frozen_string_literal: true

FactoryBot.define do
  factory :deal do
    name { Faker::Name.name }
    amount { Faker::Number.between(from: 1, to: 5000) }
    status { Deal::STATUSES.sample }
    company { Company.first || create(:company) }
  end
end
