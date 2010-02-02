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

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
