class Poll < ApplicationRecord
  has_many :choices
  has_many :votes
  belongs_to :user
  accepts_nested_attributes_for :choices
end
