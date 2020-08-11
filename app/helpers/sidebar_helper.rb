module SidebarHelper
  
  def index
    @properties = Property.all
    @agent = @property.account
    @agent_properties = Property.where(account_id: @agent.id).where.not(id: @property.id)
  end

end