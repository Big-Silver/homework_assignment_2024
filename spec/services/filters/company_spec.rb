# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Filters::Company do
  let(:company_filters) { Filters::Company.new(Company.all, params) }
  let(:subject) { company_filters.call }
  let!(:companies) { create_list(:company, 5) }
  let!(:deal1) { create(:deal, company: companies.first) }
  let!(:deal2) { create(:deal, company: companies.first) }

  context 'when company name filter applied' do
    let!(:company1) { create(:company, name: 'abcCompany123xyz') }
    let(:params) { { company_name: 'Company123' } }

    it 'should return only filtered company' do
      companies = subject

      expect(companies.size).to eq(1)
      expect(companies.first.name).to eq(company1.name)
    end
  end

  context 'when industry filter applied' do
    let!(:company1) { create(:company, industry: 'aindustry1e') }
    let(:params) { { industry: 'industry1' } }

    it 'should return only filtered company' do
      companies = subject

      expect(companies.size).to eq(1)
      expect(companies.first.name).to eq(company1.name)
    end
  end

  context 'when min_employee filter applied' do
    let!(:company1) { create(:company, employee_count: 5050) }
    let(:params) { { min_employee: 5001 } }

    it 'should return only filtered company' do
      companies = subject

      expect(companies.size).to eq(1)
      expect(companies.first.name).to eq(company1.name)
    end
  end

  context 'when minimum_deal_amount filter applied' do
    let!(:company1) { create(:company) }
    let!(:deal1) { create(:deal, company: company1, amount: 5000) }
    let!(:deal2) { create(:deal, company: company1, amount: 100) }
    let(:params) { { minimum_deal_amount: 5001 } }

    it 'should return only filtered company' do
      companies = subject

      expect(companies.uniq.size).to eq(1)
      expect(companies.first.name).to eq(company1.name)
    end
  end
end
