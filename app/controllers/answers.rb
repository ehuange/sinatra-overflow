get '/questions/:id/answers' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  erb :'answers/index'
end

get '/questions/:id/answers/new' do
  @question = Question.find(params[:id])
  erb :'answers/new'
end

post '/questions/:id/answers' do
    if !(logged_in?) then redirect "/questions/#{params[:id]}" end
  @question = Question.find(params[:id])
  @answer = Answer.new(params[:answer])
  @answer.assign_attributes(question_id: @question.id, answerer_id: session[:id])
  @answer.save
  if request.xhr?
    erb :'/components/_a-container', layout: false, locals: { answer: @answer }
  else
    redirect "/questions/#{@question.id}/answers"
  end
end

put '/questions/:id/answers/:answer_id/bestanswer' do
  answers = Question.find(params[:id]).answers.all
  Answer.reset_best_answer(answers)
  Answer.find(params[:answer_id]).update_attributes(best_answer: 1)

  if request.xhr?
    "THIS ANSWER ROCKS!"
  else
    redirect "/questions/#{params[:id]}"
  end

end

get '/questions/:id/answers/:answer_id/edit' do
  @question = Question.find(params[:id])
  @answer = Answer.find(params[:answer_id])
  if request.xhr?
    erb :'answers/_edit', layout: false, locals: {question: @question, answer: @answer}
  else
    erb :'answers/edit'
  end
end

put '/questions/:id/answers/:answer_id' do
  @answer = Answer.find(params[:answer_id])
  @answer.update_attributes(params[:answer])
  if request.xhr?
    erb :'/components/_a-container', layout: false, locals: {answer: @answer}
  else
    redirect "/questions/#{@question.id}/answers"
  end
end

delete '/questions/:id/answers/:answer_id' do
  @answer = Answer.find(params[:answer_id])
  @answer.destroy
  if request.xhr?
    "Answer will be deleted"
  else
    redirect "/questions/#{params[:id]}/answers"
  end
end
