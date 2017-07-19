class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :value, null: false, default: 0
      t.integer :votable_id, null: false
      t.string :votable_type, null: false
      t.integer :user_id

      t.timestamps(null: false)
    end

    add_index :votes, [:votable_type, :votable_id]
  end
end
