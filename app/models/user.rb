require 'bcrypt'

class User < ApplicationRecord
  # Remember to create a migration!
  has_many :questions, foreign_key: :questioner_id
  has_many :answers, foreign_key: :answerer_id
  has_many :answers_to_questions, {through: :questions, source: :answers}

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end