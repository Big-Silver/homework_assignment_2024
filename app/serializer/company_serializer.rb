class CompanySerializer
  include ::JSONAPI::Serializer

  set_type :company

  attributes :id, :name, :industry, :employee_count

  attribute :deals_amount do |company|
    company.deals.collect(&:amount).sum
  end
end
