import React, { useEffect, useState } from "react";
import axios from 'axios';

export default () => {
  // List of fetched companies
  const [companies, setCompanies] = useState([]);

  // Table filters
  const [companyName, setCompanyName] = useState("");
  const [industry, setIndustry] = useState("");
  const [minEmployee, setMinEmployee] = useState("");
  const [minimumDealAmount, setMinimumDealAmount] = useState("");

  const payload = {
    company_name: companyName,
    industry: industry,
    min_employee: minEmployee,
    minimum_deal_amount: minimumDealAmount
  }

  // Applying filters
  const applyFilter = () => {
    fetchCompanies();
  }

  // Fetch companies callback
  const fetchCompanies = () => {
    axios.get(
      '/api/v1/companies',
      { params: payload }
    )
    .then(res => {
      setCompanies(res?.data?.data)
    })
  }

  // Fetch companies from API
  useEffect(() => { fetchCompanies() }, [])

  return (
    <div className="vw-100 primary-color d-flex align-items-center justify-content-center">
      <div className="jumbotron jumbotron-fluid bg-transparent">
        <div className="container secondary-color">
          <h1 className="display-4">Companies</h1>

          <label htmlFor="company-name">Company Name</label>
          <div className="input-group mb-3">
            <input type="text" className="form-control" id="company-name" value={companyName} onChange={e => setCompanyName(e.target.value)} />
          </div>

          <label htmlFor="industry">Industry</label>
          <div className="input-group mb-3">
            <input type="text" className="form-control" id="industry" value={industry} onChange={e => setIndustry(e.target.value)} />
          </div>

          <label htmlFor="min-employee">Minimum Employee Count</label>
          <div className="input-group mb-3">
            <input type="number" className="form-control" id="min-employee" value={minEmployee} onChange={e => setMinEmployee(e.target.value)} />
          </div>

          <label htmlFor="min-amount">Minimum Deal Amount</label>
          <div className="input-group mb-3">
            <input type="number" className="form-control" id="min-amount" value={minimumDealAmount} onChange={e => setMinimumDealAmount(e.target.value)} />
          </div>

          <button type="button" className="btn-primary" onClick={ () => applyFilter() }>Filter</button>

          <table className="table">
            <thead>
              <tr>
                <th scope="col">Name</th>
                <th scope="col">Industry</th>
                <th scope="col">Employee Count</th>
                <th scope="col">Total Deal Amount</th>
              </tr>
            </thead>
            <tbody>
              {companies.map((company) => (
                <tr key={company.id}>
                  <td>{company.attributes.name}</td>
                  <td>{company.attributes.industry}</td>
                  <td>{company.attributes.employee_count}</td>
                  <td>{company.attributes.deals_amount}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  )
};
