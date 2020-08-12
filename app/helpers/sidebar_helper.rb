module SidebarHelper

  def index
    @properties = Property.all
    @agent = @property.account
    @agent_properties = Property.where(account_id: @agent.id).where.not(id: @property.id)
  end

  def profile_picture account, width = 100
    thumb = account.image.present? ? account.image.thumb.url : "noimage.png"
    image_tag thumb, width: width, class: "profile-pic img-circle"
  end
  
end
