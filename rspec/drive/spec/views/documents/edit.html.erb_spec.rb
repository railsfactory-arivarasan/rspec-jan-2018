require 'rails_helper'

RSpec.describe "documents/edit", type: :view do
  before(:each) do
    @document = assign(:document, Document.create!(
      :name => "MyString",
      :folder_id => 1,
      :size => 1
    ))
  end

  it "renders the edit document form" do
    render

    assert_select "form[action=?][method=?]", document_path(@document), "post" do

      assert_select "input#document_name[name=?]", "document[name]"

      assert_select "input#document_folder_id[name=?]", "document[folder_id]"

      assert_select "input#document_size[name=?]", "document[size]"
    end
  end
end
