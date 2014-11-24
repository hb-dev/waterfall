class AddHeaderFieldsToStylesheets < ActiveRecord::Migration
  def change
    add_column :stylesheets, :font_size_header, :string
    add_column :stylesheets, :color_header, :string
  end
end
