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

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
