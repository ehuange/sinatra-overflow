class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.integer :question_id, null: false
      t.integer :answerer_id, null: false
      t.integer :best_answer, default: 0

      t.timestamps(null: false)
    end
  end
end
