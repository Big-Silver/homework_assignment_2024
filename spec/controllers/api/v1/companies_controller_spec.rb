# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Api::V1::Companies', type: :request do
  describe 'actions' do
    context 'when #index' do
      let(:params) { {} }
      let(:request) { get '/api/v1/companies', params: params }
      let!(:companies) { create_list(:company, 5) }

      context 'without filters' do
        it 'should return http success code' do
          request

          expect(response).to have_http_status(:ok)
        end

        it 'should return companies' do
          request

          expect(::JSON.parse(response.body)['data'].size).to eq(5)
          expect(
            ::JSON.parse(response.body)['data'].first['attributes'].keys - 
            ["id", "name", "industry", "employee_count", "deals_amount"]
          ).to eq([])
        end
      end

      context 'with filters' do
        context 'when company name filter applied' do
          let!(:company1) { create(:company, name: 'abcCompany123xyz') }
          let(:params) { { company_name: 'Company123' } }

          it 'should return only filtered company' do
            request

            expect(::JSON.parse(response.body)['data'].size).to eq(1)
            expect(::JSON.parse(response.body)['data'].first['attributes']['name']).to eq(company1.name)
          end
        end

        context 'when industry filter applied' do
          let!(:company1) { create(:company, industry: 'aindustry1e') }
          let(:params) { { industry: 'industry1' } }

          it 'should return only filtered company' do
            request

            expect(::JSON.parse(response.body)['data'].size).to eq(1)
            expect(::JSON.parse(response.body)['data'].first['attributes']['name']).to eq(company1.name)
          end
        end

        context 'when min_employee filter applied' do
          let!(:company1) { create(:company, employee_count: 5050) }
          let(:params) { { min_employee: 5001 } }

          it 'should return only filtered company' do
            request

            expect(::JSON.parse(response.body)['data'].size).to eq(1)
            expect(::JSON.parse(response.body)['data'].first['attributes']['name']).to eq(company1.name)
          end
        end

        context 'when minimum_deal_amount filter applied' do
          let!(:company1) { create(:company) }
          let!(:deal1) { create(:deal, company: company1, amount: 5000) }
          let!(:deal2) { create(:deal, company: company1, amount: 100) }
          let(:params) { { minimum_deal_amount: 5001 } }

          it 'should return only filtered company' do
            request

            expect(::JSON.parse(response.body)['data'].size).to eq(1)
            expect(::JSON.parse(response.body)['data'].first['attributes']['name']).to eq(company1.name)
          end
        end
      end
    end
  end
end
