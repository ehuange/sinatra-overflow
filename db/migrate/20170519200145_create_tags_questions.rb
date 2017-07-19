class CreateTagsQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :tags_questions do |t|
      t.integer :question_id
      t.integer :tag_id

      t.timestamps(null: false)
    end
  end
end
