class Category < ApplicationRecord
  has_many :reivew_categories, foreign_key: 'category_id'
  has_many :reviews , through: :review_categories
end
