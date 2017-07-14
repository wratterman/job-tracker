require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = Category.create!(name: "Broadcasting")
    visit edit_category_path(category)

    fill_in "category[name]", with: "Entertainment"
    click_button "Update"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("Entertainment")
    expect(page).to_not have_content("Broadcasting")
  end
end
