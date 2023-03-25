class Review < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :review, presence: true
end
