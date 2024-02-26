class Filters::Company
  ALLOWED_FILTERS = %w[company_name industry min_employee minimum_deal_amount]

  def initialize(companies, filters)
    @companies = companies
    @filters   = filters
  end

  def call
    @filters.each do |key, value|
      next if ALLOWED_FILTERS.exclude?(key.to_s) || value.blank?

      @companies = public_send("filter_by_#{key}", value)
    end

    @companies
  end

  def filter_by_company_name(name)
    @companies.where("companies.name LIKE '%#{name}%'")
  end

  def filter_by_industry(industry)
    @companies.where("companies.industry LIKE '%#{industry}%'")
  end

  def filter_by_min_employee(employee)
    @companies.where("companies.employee_count >= :employee", employee: employee.to_i)
  end

  def filter_by_minimum_deal_amount(amount)
    @companies.joins("INNER JOIN deals ON companies.id = deals.company_id")
              .group("companies.id")
              .having("SUM(deals.amount) >= :amount", amount: amount.to_i)
  end
end
