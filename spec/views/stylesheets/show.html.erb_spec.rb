require 'spec_helper'

describe "stylesheets/show" do
  before(:each) do
    @stylesheet = assign(:stylesheet, stub_model(Stylesheet,
      :account_id => 1,
      :font-family => "Font Family",
      :font-size => "Font Size",
      :color => "Color",
      :border-color => "Border Color"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Font Family/)
    rendered.should match(/Font Size/)
    rendered.should match(/Color/)
    rendered.should match(/Border Color/)
  end
end
