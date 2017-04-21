require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page"

  feature "signing up a user" do

    scenario "goes to the right path and displays username" do
      sign_up_user('KeanuReeves', 'assword')
      expect(current_path).to eq("users/#{ User.find_by(username: 'KeanuReeves').id }")
    # scenario "shows username on the homepage after signup" do
      expect(page).to have_content("KeanuReeves")
    end
  end

end

feature "logging in" do

  scenario "shows username on the homepage after login"

end

feature "logging out" do

  scenario "begins with a logged out state"

  scenario "doesn't show username on the homepage after logout"

end
