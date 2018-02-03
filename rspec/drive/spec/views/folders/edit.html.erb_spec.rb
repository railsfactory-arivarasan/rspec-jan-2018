require 'rails_helper'

RSpec.describe "folders/edit", type: :view do
  before(:each) do
    @folder = assign(:folder, Folder.create!(
      :user => nil,
      :name => "MyString",
      :size => 1
    ))
  end

  it "renders the edit folder form" do
    render

    assert_select "form[action=?][method=?]", folder_path(@folder), "post" do

      assert_select "input#folder_user_id[name=?]", "folder[user_id]"

      assert_select "input#folder_name[name=?]", "folder[name]"

      assert_select "input#folder_size[name=?]", "folder[size]"
    end
  end
end
