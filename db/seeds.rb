require 'faker'

10.times do
  # Generate a fake user
  username = Faker::Internet.user_name
  email = Faker::Internet.safe_email
  user = User.create(username: username, email: email, password: 'password')
  # Have fake user ask 3 questions
  3.times do
    title = Faker::Lorem.sentence
    question = Faker::Lorem.paragraphs(2).join('')
    Question.create(title: title, body: question, questioner_id: user.id)
    sleep(1)
  end
  sleep(2)
end

# For each question, generate 3 answers
Question.all.each do |question|
  2.times do
  # Choose a random user to provide the answer
  user = User.where.not(id: question.questioner_id).sample
  answer = Faker::Lorem.paragraphs(2).join('')
  Answer.create(body: answer, answerer_id: user.id, question_id: question.id)
  sleep(1)
  end
  sleep(2)
end
