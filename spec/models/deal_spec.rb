# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Deal, type: :model do
  describe '#attributes' do
    let(:deal) { build(:deal) }

    context 'when name is blank' do
      before do
        deal.name = ''
      end

      it 'should return the error message' do
        expect(deal.save).to eq(false)
        expect(deal.errors.full_messages.include?("Name can't be blank")).to be true
      end
    end

    context 'when amount is blank' do
      before do
        deal.amount = ''
      end

      it 'should return the error message' do
        expect(deal.save).to eq(false)
        expect(deal.errors.full_messages.include?("Amount is not a number")).to be true
      end
    end

    context 'when amount is 0' do
      before do
        deal.amount = 0
      end

      it 'should return the error message' do
        expect(deal.save).to eq(false)
        expect(deal.errors.full_messages.include?("Amount must be greater than 0")).to be true
      end
    end

    context 'when status is not included in the list' do
      before do
        deal.status = 'abc'
      end

      it 'should return the error message' do
        expect(deal.save).to eq(false)
        expect(deal.errors.full_messages.include?("Status is not included in the list")).to be true
      end
    end
  end
end
