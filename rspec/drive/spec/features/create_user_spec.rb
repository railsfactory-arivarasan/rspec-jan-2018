require 'rails_helper'

describe "create user", :type => :feature do
  it "creates a new user" do
    visit '/users/new'
    sleep 5
    # within("#session") do
    #   fill_in 'Email', with: 'user@example.com'
    #   fill_in 'Password', with: 'password'
    # end
    # click_button 'Create User'
    # expect(page).to have_content 'User was successfully created.'
  end
end