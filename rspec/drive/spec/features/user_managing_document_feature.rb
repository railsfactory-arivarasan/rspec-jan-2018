require 'rails_helper'

describe "list document", type: :feature do
  it "should list all documents" do
    visit('/documents')
    expect(page).to have_content 'Documents'
  end

  scenario "click edit link" do
    visit('/documents')
    within "#document_list" do
      first(:link, "Edit").click
    end

    within(".edit_document") do
      fill_in 'Name', with: Faker::Name.name
    end
    click_button "Update Document"
    expect(page).to have_content "Document was successfully updated."
  end

  scenario "validate for empty folder" do
    visit('/documents/new')
    within("#new_document") do
      fill_in 'Name', with: Faker::Name.name
      fill_in 'Size', with: Faker::Number.between(1, 100)
    end
    click_button 'Create Document'
    expect(page).to have_content "Folder can't be blank"
  end

  scenario "go back to documents" do
    visit('/documents/new')
    within("#new_document") do
      fill_in 'Name', with: Faker::Name.name
      fill_in 'Size', with: Faker::Number.between(1, 100)
    end
    click_link 'Back'
    expect(page).to have_content "Documents"
  end

  it "should create a new document" do
    visit('/documents/new')
    within("#new_document") do
      fill_in 'Name', with: Faker::Name.name
      fill_in 'Folder', with: create(:folder).id
      fill_in 'Size', with: Faker::Number.between(1, 100)
    end
    click_button 'Create Document'
    expect(page).to have_content 'Document was successfully created.'
  end

  scenario "click show link" do
    visit('/documents')
    within "#document_list" do
      first(:link, "Show").click
    end

    expect(page).to have_content "Name"
  end

  scenario "click destroy link" do
    visit('/documents')
    within "#document_list" do
      first(:link, "Destroy").click
    end
    page.accept_alert

    expect(page).to have_content "Document was successfully destroyed."
  end

end