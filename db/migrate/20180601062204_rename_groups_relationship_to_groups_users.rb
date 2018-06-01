class RenameGroupsRelationshipToGroupsUsers < ActiveRecord::Migration[5.1]
  def self.up
    rename_table :group_relationships, :group_users
  end

  def self.down
    rename_table :group_users, :group_relationships
  end
end
