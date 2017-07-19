get "/questions/:id/comments/new" do
  @question = Question.find(params[:id])
  erb :'comments/questionnew'
end

post "/questions/:id/comments" do
  if !(logged_in?) then redirect "/questions/#{params[:id]}" end
  new_comment = Comment.create(body: params[:body], commentable_id: params[:id], commentable_type: "Question", user: current_user)
  if request.xhr?
    erb :'/components/_c-container', layout:false, locals: {comment: new_comment}
  else
    redirect "/questions/#{params[:id]}"
  end
end

get "/questions/:id/answers/:answer_id/comments/new" do
  @question = Question.find(params[:id])
  @answer = Answer.find(params[:answer_id])
  erb :'comments/answernew'
end

post "/questions/:id/answers/:answer_id/comments" do
  if !(logged_in?) then redirect "/questions/#{params[:id]}" end
  new_comment = Comment.create(body: params[:body], commentable_id: params[:answer_id], commentable_type: "Answer", user: current_user)
  if request.xhr?
    erb :'/components/_c-container', layout:false, locals: {comment: new_comment}
  else
    redirect "/questions/#{params[:id]}"
  end
end
