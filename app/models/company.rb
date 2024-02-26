# == Schema Information
#
# Table name: companies
#
#  id             :bigint           not null, primary key
#  employee_count :integer
#  industry       :string
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Company < ApplicationRecord
  has_many :deals

  validates :name, presence: true
  validates :industry, presence: true
  validates :employee_count, numericality: { greater_than: 0 }
end
