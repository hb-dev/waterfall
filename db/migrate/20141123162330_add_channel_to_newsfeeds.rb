class AddChannelToNewsfeeds < ActiveRecord::Migration
  def change
    add_column :newsfeeds, :channel, :integer
  end
end
