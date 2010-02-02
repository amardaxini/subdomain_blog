# == Schema Information
#
# Table name: comments
#
#  id          :integer(4)      not null, primary key
#  article_id  :integer(4)
#  author_name :string(255)
#  site_url    :string(255)
#  email_id    :string(255)
#  content     :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :article
  
  validates_presence_of :author_name, :content
end
