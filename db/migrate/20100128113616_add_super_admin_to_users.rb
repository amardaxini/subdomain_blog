class AddSuperAdminToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :super_admin, :boolean
  end

  def self.down
    remove_column :users, :super_admin
  end
end
