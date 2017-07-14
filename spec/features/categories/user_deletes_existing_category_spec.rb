require 'rails_helper'

describe "User deletes existing category" do
  scenario "a user can delete a category" do
    category = Category.create(name: "Sanitation")
    visit category_path(category)

    expect(Category.count).to eq(1)
    click_link "Delete"

    expect(current_path).to eq("/categories")
    expect(Category.count).to eq(0)
  end
end
