require 'spec_helper'

describe "stylesheets/new" do
  before(:each) do
    assign(:stylesheet, stub_model(Stylesheet,
      :account_id => 1,
      :font-family => "MyString",
      :font-size => "MyString",
      :color => "MyString",
      :border-color => "MyString"
    ).as_new_record)
  end

  it "renders new stylesheet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stylesheets_path, "post" do
      assert_select "input#stylesheet_account_id[name=?]", "stylesheet[account_id]"
      assert_select "input#stylesheet_font-family[name=?]", "stylesheet[font-family]"
      assert_select "input#stylesheet_font-size[name=?]", "stylesheet[font-size]"
      assert_select "input#stylesheet_color[name=?]", "stylesheet[color]"
      assert_select "input#stylesheet_border-color[name=?]", "stylesheet[border-color]"
    end
  end
end
