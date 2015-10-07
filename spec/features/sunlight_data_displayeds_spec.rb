require 'rails_helper'

RSpec.feature "SunlightDataDisplayeds", type: :feature do

  scenario "unregistered guest sees welcome page content" do
    visit welcome_path

    within("#colorado-senators") do
      expect(page).to have_content("Cory Gardner")
      expect(page).to have_content("Michael Bennett")
    end
  end

end
