require 'rails_helper'
# As a guest user (no sign in required)
feature "As a guest user" do
  context "they visit root path, fill in the search box with a word" do
    scenario "they see a list of examples of how to use the word" do
      visit '/'

      fill_in "p", with: "mindfulness"
      click_on "Submit"

      expect(page).to have_content("Examples for using 'mindfulness")
      expect(page).to have_content("Canadian: Meditation is one way to express mindfulness in a dedicated, concentrated manner.")
      expect(page).to have_content("British: At such times, mindfulness of the practice of patience and the application of certain techniques will help us to continue generating this attitude.")
      expect(page).to have_content("Canadian: All this in a plant with no eyes or imaging organs anybody knows about, no brain or nervous system to support mindfulness.")
    end
  end
end
# When I visit "/"
# And I fill in a text box with "mindfulness"
# And I click "Submit"
# Then I should see a message that says "Examples for using 'mindfulness'"
# And I should see a list of sentences with examples of how to use the word
# And I should see only sentences where the region for usage is "Brittish" or "Canadian"
# And I should not see sentences for any other regions (or blank regions)