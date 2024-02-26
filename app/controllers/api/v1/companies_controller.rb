class Api::V1::CompaniesController < ApplicationController
  include JSONAPI::Fetching

  ALLOWED_INCLUDE_KEYS = %w[deals].freeze

  def index
    company_filters = ::Filters::Company.new(Company.all, company_params)
    companies = company_filters.call.order(created_at: :desc)

    render json: CompanySerializer.new(companies.includes(:deals))
  end

  private

  def company_params
    params.permit(:company_name, :industry, :min_employee, :minimum_deal_amount)
  end
end
