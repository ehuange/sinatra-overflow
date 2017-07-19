class Vote < ApplicationRecord
  # Remember to create a migration!
  belongs_to :votable, polymorphic: true
  belongs_to :user
end
