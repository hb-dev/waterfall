require 'spec_helper'

describe "stylesheets/index" do
  before(:each) do
    assign(:stylesheets, [
      stub_model(Stylesheet,
        :account_id => 1,
        :font-family => "Font Family",
        :font-size => "Font Size",
        :color => "Color",
        :border-color => "Border Color"
      ),
      stub_model(Stylesheet,
        :account_id => 1,
        :font-family => "Font Family",
        :font-size => "Font Size",
        :color => "Color",
        :border-color => "Border Color"
      )
    ])
  end

  it "renders a list of stylesheets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Font Family".to_s, :count => 2
    assert_select "tr>td", :text => "Font Size".to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    assert_select "tr>td", :text => "Border Color".to_s, :count => 2
  end
end
