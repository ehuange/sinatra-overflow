class Answer < ApplicationRecord
  # Remember to create a migration!
  belongs_to :answerer, class_name: :User
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  def points
    votes.sum(:value)
  end

  def self.reset_best_answer(answers)
    answers.each do |answer|
      answer.update_attributes(best_answer: 0)
    end
  end

  def best_answer?
    self.best_answer == 1
  end

  def bad_answer?
    self.points < 0
  end
end
