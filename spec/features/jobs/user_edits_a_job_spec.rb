require 'rails_helper'

RSpec.feature "User goes to jobs index" do
  scenario "they see the page with all jobs" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(name: "Sports Broadcasting")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    visit company_job_path(company, job)
    click_on "Edit"
    fill_in "Title", with: "Research Assistant"
    click_on "Update Job"

    expect(page).to have_content "Research Assistant"
    expect(page).to have_content(70)
  end
end
