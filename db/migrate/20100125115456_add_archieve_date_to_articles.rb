class AddArchieveDateToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :archieve_date, :string
  end

  def self.down
    remove_column :articles, :archieve_date
  end
end
