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

require 'test_helper'

class CategoryArticleTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
