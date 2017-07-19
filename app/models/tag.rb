class Tag < ApplicationRecord
  has_many :tagquestions, class_name: :TagQuestion, foreign_key: :tag_id
  has_many :questions, through: :tagquestions

  def self.make_tags(arr, question)
    arr.each do |tag|
      this_tag = Tag.find_or_create_by(tag: tag.downcase)
      TagQuestion.create(question_id: question.id, tag_id: this_tag.id)
    end
  end
end
