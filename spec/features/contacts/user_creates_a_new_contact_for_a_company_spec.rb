require 'rails_helper'

describe "User creates a new contact" do
  scenario "a user can create a new contact" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(name: "Education")
    job = company.jobs.create!(title: "Winner", description: "Winning",
                              level_of_interest: 10, city: "Denver",
                              category_id: category.id)
    visit company_path(company)

    fill_in "contact[full_name]", with: "Mary Ann"
    fill_in "contact[position]", with: "Recruiter"
    fill_in "contact[email]", with: "M.A@bossworld.edu"

    click_button "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content("Winner")
    expect(page).to have_content("ESPN")
  end
end
