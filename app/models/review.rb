class Review < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :review, presence: true
  
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
   favorites.where(user_id: user.id).exists?
  end
  
  after_create do
    review = Review.find_by(id: self.id)
    hashtags = self.content.scan
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      review.hashtags << tag
    end
  end
  
  before_update do
    review = Review.find_by(id: self.id)
    review.hashtags.clear
    hashtags = self.content.scan
      hashtags.uniq.map do |hashtag|
        tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.selete('#'))
        review.hashtags << tag
      end
  end



end
