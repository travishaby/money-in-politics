require 'rails_helper'

RSpec.feature "WelcomePageFeaturedData", type: :feature do
  scenario "unregistered guest seems featured data on welcome page" do

    visit welcome_path

    within("#colorado-senators") do
      expect(page).to have_content("Cory Gardner")
      expect(page).to have_content("Michael Bennett")
    end
  end

end
