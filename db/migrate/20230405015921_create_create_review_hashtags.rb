class CreateCreateReviewHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :create_review_hashtags do |t|

      t.timestamps
    end
  end
end
