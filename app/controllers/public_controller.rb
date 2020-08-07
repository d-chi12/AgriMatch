class PublicController < ApplicationController
  def main
    if account_signed_in?
      path = current_account.admin? ? accounts_path : dashboard_path
      redirect_to dashboard_path, flas: { success: "サインインに成功しました。AgriMatchへようこそ！" } and return
    end

    @properties = Property.latest
    @posts = Post.latest
  end
end
