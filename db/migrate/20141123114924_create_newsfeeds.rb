class CreateNewsfeeds < ActiveRecord::Migration
  def change
    create_table :newsfeeds do |t|
      t.string :name
      t.string :api_key
      t.string :material_type
      t.integer :material_limit
      t.string :material_order
      t.datetime :material_start_at
      t.datetime :material_end_at

      t.timestamps
    end
  end
end
