module ProfileHelper

  def cover_image_url account
    account.cover_image.present? ? account.cover_image.url : asset_url("noimage.png")
  end

  def account_thumbnail_url account
    account.image.present? ? account.image.thumb.url : asset_url("noimage.png")
  end
  
end