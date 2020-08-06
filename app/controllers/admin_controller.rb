class AdminController < ApplicationController
  before_action :can_access?

  def accounts
    @accounts = Account.all
  end

  def can_access?
    @show_sidebar = true

    unless current_account
      redirect_to root_url, flash: { danger: "You do not have access to view this page" }
    end
  end
end