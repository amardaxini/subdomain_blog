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

require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
