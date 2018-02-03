require 'rails_helper'

describe "create user", :type => :feature do
  it "creates a new user" do
    visit '/users/new'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Name', with: 'user'
    click_button 'Create User'
    sleep 2
    expect(page).to have_content 'User was successfully created.'
  end
end