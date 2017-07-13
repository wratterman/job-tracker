require 'rails_helper'

describe "User sees one category" do
  scenario "a user sees a category" do
    category = Category.create!(name: "Tech")
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category_id: category.id)

    visit category_path(category)

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content("Tech")
    expect(page).to have_content("Developer")
  end
end
