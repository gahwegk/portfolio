class Review < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :review, presence: true
  
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  has_many :review_hashtags
  has_many :hashtags, through: :review_hashtags
  
  def favorited_by?(user)
   favorites.where(user_id: user.id).exists?
  end
  
  after_create do
    review = Review.find_by(id: self.id)
    hashtags = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    review.hashtags = []
     hashtags.uniq.map do |hashtag|
       tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
       review.hashtags << tag
    end
  end
  
  before_update do
    review = Review.find_by(id: self.id)
    review.hashtags.clear
    hashtags = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
      hashtags.uniq.map do |hashtag|
        tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
        review.hashtags << tag
      end
  end



end
