class AdminController < ApplicationController
  before_action :can_access?

  def accounts
    @accounts = Account.all
    @account = Account.find_by(params[:id])
  end

  def can_access?
    @show_sidebar = true

    unless current_account
      redirect_to root_url, flash: { danger: "このページを表示するアクセス権がありません" }
    end
  end
  
end