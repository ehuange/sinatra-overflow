class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.text :answer, null: false
      t.integer :question_id, null: false
      t.integer :answerer_id, null: false

      t.timestamps(null: false)
    end
  end
end
