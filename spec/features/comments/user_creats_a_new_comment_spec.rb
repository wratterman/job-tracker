require 'rails_helper'

describe "User creates a new comment" do
  scenario "a user can create a new comment" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(name: "Sports Broadcasting")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit company_job_path(company, job)

    fill_in "comment[body]", with: "This went well"
    click_button "Create Comment"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content("This went well")
    expect(page).to have_content("Posted less than a minute later")
    expect(Comment.count).to eq(1)
  end
end
