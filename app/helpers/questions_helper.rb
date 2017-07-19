module QuestionsHelper

  def questions_by_highest_vote
    Question.all.sort_by{ |q| q.points }.reverse
  end

  def answers_by_highest(collection)
    collection.sort_by{ |a| a.points  }.reverse
  end

  def questions_by_most_recent
    Question.all.sort_by{ |q| q.created_at }.reverse
  end

  def questions_by_trending
    #find question with most recent activity
    qs_hash = {}
    Question.all.each do |q|
      # collect most recent timestamp of a given question's votes & answers (along w/ q creation timestamp)
      timestamps = []
      timestamps << q.created_at
      if q.votes.first
        timestamps << q.votes.sort_by{|v| v.created_at}.last.created_at
      end
      if q.answers.first
        timestamps << q.answers.sort_by{|a| a.created_at}.last.created_at
      end
      # find most recent timestamp of the three
      most_recent_timestamp = timestamps.sort.last
      # create hash of #question=>most_recent_timestamp
      qs_hash[q] = most_recent_timestamp
    end
    # sort by most recent timestamp and return array of questions
    qs_hash.sort_by{|question,timestamp| timestamp}.reverse.to_h.keys
  end

end

helpers QuestionsHelper
