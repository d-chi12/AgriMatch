module PostsHelper
  def post_thumbnail_url post
    post.image.present? ? post.image.thumb.url : "noimage.png"
  end
end
