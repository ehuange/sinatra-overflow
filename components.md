# Convention suggestions

underscore between class and attribute
* q = Question, a = Answer, c = Comment, v = Vote, u = User
* eg. Answer.body becomes a_body
* -container, -subcontainer if contains multiple different components, leave out if not
* pluralize a to as if container has many answers

* a Comment is always nested within a question or an answer container
* a Vote is always nested within a question, answer, or comment container

# Components

## Wrappers
page-wrapper
  * width: 100%
content-wrapper
  * max-width: 960px

## Containers
* Questions
q-container
  q_title
  (v-container)
  q_body
  q_user
  (c-container)

* Answers
as-container
  a-container
    (v-container)
    a_body
    a_user
    a_timestamp
    (c-container)

* Comments
cs-container
  c-container
    (v-container)
    c_body
    c_user
    c_timestamp

* Votes
v-container
  v_downvote
  v_count
  v_upvote

* Users
u-container



tabs-container
