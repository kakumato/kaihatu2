class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :poll
  belongs_to :choice

  validates :user_id, uniqueness: { scope: :poll_id, message: "はすでにこの投票に参加しています" }
end
