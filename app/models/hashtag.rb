class Hashtag < ApplicationRecord
  validates :hashname, presence: true, length: {maximum:99}
  has_many :review_hashtags
  has_many :reivews, through: :review_hashtags
end
