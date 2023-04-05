class CreateReviewHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtags_reviews, id: false do |t|
      t.references :review_id, index: true, foreign_key: true
      t.references :hashtag_id, index: true, foreign_key: true
    end
  end
end
