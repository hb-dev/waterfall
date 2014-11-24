require 'spec_helper'

describe "stylesheets/edit" do
  before(:each) do
    @stylesheet = assign(:stylesheet, stub_model(Stylesheet,
      :account_id => 1,
      :font-family => "MyString",
      :font-size => "MyString",
      :color => "MyString",
      :border-color => "MyString"
    ))
  end

  it "renders the edit stylesheet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stylesheet_path(@stylesheet), "post" do
      assert_select "input#stylesheet_account_id[name=?]", "stylesheet[account_id]"
      assert_select "input#stylesheet_font-family[name=?]", "stylesheet[font-family]"
      assert_select "input#stylesheet_font-size[name=?]", "stylesheet[font-size]"
      assert_select "input#stylesheet_color[name=?]", "stylesheet[color]"
      assert_select "input#stylesheet_border-color[name=?]", "stylesheet[border-color]"
    end
  end
end
