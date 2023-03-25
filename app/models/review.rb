class Review < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :review, presence: true
  
  has_many :post_comments, dependent: :destroy
  
end
