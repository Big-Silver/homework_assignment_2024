# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company, type: :model do
  describe '#attributes' do
    let(:company) { build(:company) }

    context 'when name is blank' do
      before do
        company.name = ''
      end

      it 'should return the error message' do
        expect(company.save).to eq(false)
        expect(company.errors.full_messages.include?("Name can't be blank")).to be true
      end
    end

    context 'when industry is blank' do
      before do
        company.industry = ''
      end

      it 'should return the error message' do
        expect(company.save).to eq(false)
        expect(company.errors.full_messages.include?("Industry can't be blank")).to be true
      end
    end

    context 'when employee_count is blank' do
      before do
        company.employee_count = ''
      end

      it 'should return the error message' do
        expect(company.save).to eq(false)
        expect(company.errors.full_messages.include?("Employee count is not a number")).to be true
      end
    end

    context 'when employee_count is 0' do
      before do
        company.employee_count = 0
      end

      it 'should return the error message' do
        expect(company.save).to eq(false)
        expect(company.errors.full_messages.include?("Employee count must be greater than 0")).to be true
      end
    end
  end
end
