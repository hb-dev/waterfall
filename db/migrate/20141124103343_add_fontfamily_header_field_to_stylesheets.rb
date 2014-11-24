class AddFontfamilyHeaderFieldToStylesheets < ActiveRecord::Migration
  def change
    add_column :stylesheets, :font_family_header, :string
  end
end
