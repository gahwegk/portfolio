class AddReviewIdToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :review_id, :integer
  end
end
