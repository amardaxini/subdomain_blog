class AddIsPublishToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :is_publish, :boolean
  end

  def self.down
    remove_column :articles, :is_publish
  end
end
