class Comment < ApplicationRecord
  # Remember to create a migration!
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable
  belongs_to :user

  def points
    votes.sum(:value)
  end

end
