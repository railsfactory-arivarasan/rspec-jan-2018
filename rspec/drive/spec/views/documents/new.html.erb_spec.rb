require 'rails_helper'

RSpec.describe "documents/new", type: :view do
  before(:each) do
    assign(:document, Document.new(
      :name => "MyString",
      :folder_id => 1,
      :size => 1
    ))
  end

  it "renders new document form" do
    render

    assert_select "form[action=?][method=?]", documents_path, "post" do

      assert_select "input#document_name[name=?]", "document[name]"

      assert_select "input#document_folder_id[name=?]", "document[folder_id]"

      assert_select "input#document_size[name=?]", "document[size]"
    end
  end
end
