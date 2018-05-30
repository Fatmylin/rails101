class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :context, null: false
      t.references :group
      t.references :user
      t.timestamps
    end
  end
end
