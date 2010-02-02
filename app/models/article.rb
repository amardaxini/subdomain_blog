# == Schema Information
#
# Table name: articles
#
#  id            :integer(4)      not null, primary key
#  name          :string(255)
#  content       :text
#  author_name   :string(255)
#  blog_id       :integer(4)
#  user_id       :integer(4)
#  created_at    :datetime
#  updated_at    :datetime
#  is_publish    :boolean(1)
#  publish_at    :datetime
#  archieve_date :string(255)
#

class Article < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  has_many :category_articles,:dependent=>:destroy
  has_many :categories,:through=>:category_articles
  belongs_to :blog
  belongs_to :user
  validates_presence_of :name, :content
  named_scope :publish ,:conditions => {:is_publish => true}
  before_save :update_publish_at  
  def update_publish_at
    if self.is_publish && self.publish_at.blank?
      self.publish_at = DateTime.now
      self.archieve_date = self.publish_at.strftime("%B %Y")
    end
  end
  def publish_articles
    self.blog.articles.publish
  end
  
  def previous_article
    article_index = publish_articles.index(self)
    publish_articles[article_index-1] if article_index != 0
   
  end
  def next_article
    article_index = publish_articles.index(self)
    publish_articles[article_index+1] if article_index !=  publish_articles.size - 1
  end
  def publish
    self.is_publish ? "Yes" : "No"
  end
end
