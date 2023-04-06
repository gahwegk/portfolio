class CreateReviewHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :review_hashtags do |t|
      t.references :review, index: true, foreign_key: true
      t.references :hashtag, index: true, foreign_key: true
      t.timestamps
    end
  end
end
