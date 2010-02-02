# == Schema Information
#
# Table name: blogs
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  subdomain   :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  description :text
#  super_admin :boolean(1)
#

class Blog < ActiveRecord::Base

   has_many :articles, :dependent => :destroy
   has_many :users, :dependent => :destroy
   has_many :categories, :dependent => :destroy
   def user_attributes=(user_attributes) 
    self.users.build(user_attributes)
  end 
  def recent_articles(recent_no=5)
    self.articles.is_publish[0...recent_no]
  end
  def archieves
    self.articles.publish(true).group_by(& :archieve_date)
  end
  def comments
   blog_comments = []
    self.articles.each do |article|
      blog_comments<<  article.comments
    end
    blog_comments.flatten.compact
  end
end
