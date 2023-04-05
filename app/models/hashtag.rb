class Hashtag < ApplicationRecord
  has_ans_belongs_to_many :reviews
  validates :hashname, presence: true, length: {maximum:99}
end
