class SimplerAuth < ActiveRecord::Migration
  def self.up
    remove_column :users, :persistence_token
    remove_column :users, :single_access_token
    remove_column :users, :perishable_token
    remove_column :users, :google_code_password
  end

  def self.down
  end
end
