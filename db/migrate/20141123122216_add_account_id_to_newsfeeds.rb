class AddAccountIdToNewsfeeds < ActiveRecord::Migration
  def change
    add_column :newsfeeds, :account_id, :integer
  end
end
