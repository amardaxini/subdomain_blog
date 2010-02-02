# == Schema Information
#
# Table name: users
#
#  id                :integer(4)      not null, primary key
#  login             :string(255)
#  blog_id           :integer(4)
#  crypted_password  :string(255)
#  password_salt     :string(255)
#  persistence_token :string(255)
#  login_count       :integer(4)
#  last_request_at   :datetime
#  last_login_at     :datetime
#  current_login_at  :datetime
#  last_login_ip     :string(255)
#  current_login_ip  :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  name              :string(255)
#  super_admin       :boolean(1)
#

class User < ActiveRecord::Base
 attr_readonly :super_admin
 acts_as_authentic
  belongs_to :blog
  has_many :articles,:dependent=>:destroy
  validates_uniqueness_of :login
end
