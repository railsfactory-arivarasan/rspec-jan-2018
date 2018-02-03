require 'rails_helper'

RSpec.describe "folders/show", type: :view do
  before(:each) do
    @folder = assign(:folder, Folder.create!(
      :user => nil,
      :name => "Name",
      :size => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
