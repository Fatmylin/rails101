class CreateGroupRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :group_relationships do |t|
      t.references :user, null: false
      t.references :group,null: false
      t.timestamps
    end
  end
end
