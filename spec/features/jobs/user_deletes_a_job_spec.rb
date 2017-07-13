require 'rails_helper'

RSpec.feature "User goes to jobs index for a Company" do
  scenario "they see the page with all jobs" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(name: "Sports Broadcasting")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit company_job_path(company, job)
    click_on "Delete"

    expect(page).to have_current_path(company_jobs_path(company))
    expect(page).to_not have_content(job.title)
  end
end
