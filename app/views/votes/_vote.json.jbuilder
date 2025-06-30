json.extract! vote, :id, :option_text, :title, :user_id, :email_id, :created_at, :updated_at
json.url vote_url(vote, format: :json)
