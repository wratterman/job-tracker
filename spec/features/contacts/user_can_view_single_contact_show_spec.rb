require 'rails_helper'

describe "User sees a specific contact" do
  scenario "a user sees a contact for a specific company" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(name: "Sports Broadcasting")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    contact = company.contacts.create!(full_name: "Mark", position: "HR", email: "123@example.com")

    visit contact_path(contact)

    expect(page).to have_content("Mark")
    expect(page).to have_content("HR")
    expect(page).to have_content("123@example.com")
  end
end
