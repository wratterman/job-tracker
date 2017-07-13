require 'rails_helper'

RSpec.feature "User goes to artists index" do
  scenario "they see the page with all artists" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    visit company_job_path(company, job)
    click_on "Edit"
    fill_in "Title", with: "Research Assistant"
    click_on "Update Job"

    expect(page).to have_content "Research Assistant"
    expect(page).to have_content(70)
  end
end
