# == Schema Information
#
# Table name: category_articles
#
#  id          :integer(4)      not null, primary key
#  category_id :integer(4)
#  article_id  :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

class CategoryArticle < ActiveRecord::Base
 belongs_to :category
 belongs_to :article
 validates_uniqueness_of :category_id, :scope => :article_id
end
