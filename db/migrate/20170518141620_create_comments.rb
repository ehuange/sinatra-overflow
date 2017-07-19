class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :body, null: false, limit: 50
      t.integer :commentable_id, null: false
      t.string :commentable_type, null: false
      t.string :user_id, null: false

      t.timestamps(null: false)
    end

    add_index :comments, [:commentable_type, :commentable_id]
  end
end
