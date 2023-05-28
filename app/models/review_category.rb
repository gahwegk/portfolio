class ReviewCategory < ApplicationRecord
  belongs_to :review, optional: true
  belongs_to :category
end
