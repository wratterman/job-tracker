require 'rails_helper'

describe Category do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Category.new()
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Category.create(name: "Tech")
        company = Category.new(name: "Tech")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = Category.new(name: "Tech")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Category.new(name: "Tech")
      expect(company).to respond_to(:jobs)
    end
  end
end
