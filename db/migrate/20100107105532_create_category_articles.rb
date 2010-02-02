class CreateCategoryArticles < ActiveRecord::Migration
  def self.up
    create_table :category_articles do |t|
      t.integer :category_id
      t.integer :article_id
      t.timestamps
    end
  end

  def self.down
    drop_table :category_articles
  end
end
