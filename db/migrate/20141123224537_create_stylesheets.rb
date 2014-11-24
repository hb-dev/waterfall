class CreateStylesheets < ActiveRecord::Migration
  def change
    create_table :stylesheets do |t|
      t.integer :account_id
      t.string :font_family
      t.string :font_size
      t.string :color
      t.string :border_color

      t.timestamps
    end
  end
end
