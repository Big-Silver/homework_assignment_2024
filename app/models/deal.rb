# == Schema Information
#
# Table name: deals
#
#  id         :bigint           not null, primary key
#  amount     :integer
#  name       :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint           not null
#
# Indexes
#
#  index_deals_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
class Deal < ApplicationRecord
  STATUSES = %w[pending won lost]

  belongs_to :company

  validates :name, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validates :status, inclusion: STATUSES
end
