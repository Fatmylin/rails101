class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :context
      t.references :group, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
