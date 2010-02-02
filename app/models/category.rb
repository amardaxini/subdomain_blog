# == Schema Information
#
# Table name: categories
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  blog_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Category < ActiveRecord::Base
  has_many :category_articles,:dependent=>:destroy
  has_many :articles,:through=>:category_articles
  belongs_to :blog
end
