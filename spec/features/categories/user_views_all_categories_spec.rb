require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    company = Category.create!(name: "Financial")
    company_two = Category.create!(name: "Entertationment")

    visit categories_path

    expect(page).to have_content("Financial")
  end

end
