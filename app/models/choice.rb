class Choice < ApplicationRecord
  has_many :votes
  belongs_to :poll
end
