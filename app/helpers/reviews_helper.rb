module ReviewsHelper
  def render_with_hashtags(caption)
    caption.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){|word| link_to word, "/review/hashtag/#{word.delete("#")}"}.html_safe
  end
end
