class DealSerializer
  include ::JSONAPI::Serializer

  belongs_to :company

  attributes :amount
end
