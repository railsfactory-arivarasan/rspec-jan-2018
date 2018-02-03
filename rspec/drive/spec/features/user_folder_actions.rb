require 'rails_helper'

describe "create folder", :type => :feature do
  let(:user){
    create(:user)
  }
  let(:folder){
    create(:folder, user: user)
  }
  it "creates a new folder" do
    user
    visit '/folders/new'
    fill_in 'User', with: user.id
    fill_in 'Name', with: Faker::Name.name
    fill_in 'Size', with: Faker::Number.between(10,200)
    click_button 'Create Folder'
    expect(page).to have_content 'Folder was successfully created.'
  end

  it "Show created folder" do
    folder
    visit "/folders/#{folder.id}"
    sleep 2
    expect(page.find_by_id("name")).to have_content folder.name
  end

  it "Edit created folder" do
    folder
    visit "/folders"
    click_link("Edit")
    fill_in 'Name', with: Faker::Name.name
    click_button 'Update Folder'
    expect(page).to have_content "Folder was successfully updated."
  end

  it "Delete created folder" do
    folder
    visit "/folders"
    click_link("Destroy")
    wait 5
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content "Folder was successfully destroyed."
  end

end