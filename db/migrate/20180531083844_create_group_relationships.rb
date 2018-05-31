class CreateGroupRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :group_relationships do |t|
      t.references :user, null: false
      t.references :groups,null: false
      t.timestamps
    end
  end
end
