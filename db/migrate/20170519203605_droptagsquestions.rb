class Droptagsquestions < ActiveRecord::Migration[5.0]
  def change
    drop_table :tags_questions
  end
end
