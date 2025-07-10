json.extract! vote, :id, :user_id, :poll_id, :choice_id, :created_at, :updated_at
json.url vote_url(vote, format: :json)
