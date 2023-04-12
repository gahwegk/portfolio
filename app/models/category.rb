class Category < ApplicationRecord
  has_many :reivew_categories
  has_many :reviews, through: :review_categories
end
