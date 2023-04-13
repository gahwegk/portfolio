class AddYoutubeUrlToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :media_url, :string
  end
end
