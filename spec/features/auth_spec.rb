require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit(new_user_url)
    expect(current_path).to eq(new_user_path)
  end

  feature "signing up a user" do

    scenario "goes to the right path and displays username" do
      sign_up_user('KeanuReeves', 'assword')
      expect(current_path).to eq("/users/#{ User.find_by(username: 'KeanuReeves').id }")
    # scenario "shows username on the homepage after signup" do
      expect(page).to have_content("KeanuReeves")
    end
  end

end

feature "logging in" do

  scenario "shows username on the homepage after login" do
    sign_up_user('KeanuReeves','assword')
    visit users_url
    expect(page).to have_content("KeanuReeves")
  end

end

feature "logging out" do

  scenario "begins with a logged out state" do
    visit users_url
    expect(page).to_not have_content("KeanuReeves")
  end

  scenario "doesn't show username on the homepage after logout" do
    sign_up_user('KeanuReeves','assword')
    click_on "Log OUT"
    expect(page).to_not have_content("KeanuReeves")
  end

end
