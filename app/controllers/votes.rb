before '/questions/:id/*' do
  if !(logged_in?) then redirect "/questions/#{params[:id]}" end
end

post '/questions/:id/vote' do
  question = Question.find(params[:id])
  votes = question.votes.where(user: current_user)
  total_value = votes.sum('value')
  if votes.empty? || total_value <= 0
    votes.create(value: 1, user: current_user)
  else total_value == 1
    votes.create(value: -1, user: current_user)
  end
  if request.xhr?
    content_type :json
    question.points.to_json
  else
    redirect "/questions/#{params[:id]}"
  end
end

post '/questions/:id/downvote' do
  question = Question.find(params[:id])
  votes = question.votes.where(user: current_user)
  total_value = votes.sum('value')
  if votes.empty? || total_value >= 0
    votes.create(value: -1, user: current_user)
  else total_value == -1
    votes.create(value: 1, user: current_user)
  end
  if request.xhr?
    content_type :json
    question.points.to_json
  else
    redirect "/questions/#{params[:id]}"
  end
end

post '/questions/:id/comments/:comment_id/vote' do
  comment = Comment.find(params[:comment_id])
  votes = comment.votes.where(user: current_user)
  total_value = votes.sum('value')
  if votes.empty? || total_value <= 0
    votes.create(value: 1, user: current_user)
  else total_value == 1
    votes.create(value: -1, user: current_user)
  end
  if request.xhr?
    content_type :json
    comment.points.to_json
  else
    redirect "/questions/#{params[:id]}"
  end
end

post '/questions/:id/comments/:comment_id/downvote' do
  comment = Comment.find(params[:comment_id])
  votes = comment.votes.where(user: current_user)
  total_value = votes.sum('value')
  if votes.empty? || total_value >= 0
    votes.create(value: -1, user: current_user)
  else total_value == -1
    votes.create(value: 1, user: current_user)
  end
  if request.xhr?
    content_type :json
    comment.points.to_json
  else
    redirect "/questions/#{params[:id]}"
  end
end

post '/questions/:id/answers/:answer_id/vote' do
  answer = Answer.find(params[:answer_id])
  votes = answer.votes.where(user: current_user)
  total_value = votes.sum('value')
  if votes.empty? || total_value <= 0
    votes.create(value: 1, user: current_user)
  else total_value == 1
    votes.create(value: -1, user: current_user)
  end
  if request.xhr?
    content_type :json
    answer.points.to_json
  else
    redirect "/questions/#{params[:id]}"
  end
end

post '/questions/:id/answers/:answer_id/downvote' do
  answer = Answer.find(params[:answer_id])
  votes = answer.votes.where(user: current_user)
  total_value = votes.sum('value')
  if votes.empty? || total_value >= 0
    votes.create(value: -1, user: current_user)
  else total_value == -1
    votes.create(value: 1, user: current_user)
  end
  if request.xhr?
    content_type :json
    answer.points.to_json
  else
    redirect "/questions/#{params[:id]}"
  end
end

post '/questions/:id/answers/:answer_id/comments/:comment_id/vote' do
  comment = Comment.find(params[:comment_id])
  votes = comment.votes.where(user: current_user)
  total_value = votes.sum('value')
  if votes.empty? || total_value <= 0
    votes.create(value: 1, user: current_user)
  else total_value == 1
    votes.create(value: -1, user: current_user)
  end
  if request.xhr?
    content_type :json
    comment.points.to_json
  else
    redirect "/questions/#{params[:id]}"
  end
end

post '/questions/:id/answers/:answer_id/comments/:comment_id/downvote' do
  comment = Comment.find(params[:comment_id])
  votes = comment.votes.where(user: current_user)
  total_value = votes.sum('value')
  if votes.empty? || total_value >= 0
    votes.create(value: -1, user: current_user)
  else total_value == -1
    votes.create(value: 1, user: current_user)
  end
  if request.xhr?
    content_type :json
    comment.points.to_json
  else
    redirect "/questions/#{params[:id]}"
  end
end
