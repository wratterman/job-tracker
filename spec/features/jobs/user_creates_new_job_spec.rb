require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    company = Company.create!(name: "ESPN")
    category1 = Category.create(name: "Medical")
    category2 = Category.create(name: "Animal Care")
    visit company_path(company)

    click_on "New Job"
    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    select "Medical", :from => "job_category_id"

    click_button "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{company.jobs.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
    expect(Job.last.category.name).to eq("Medical")
  end
end
