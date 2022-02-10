class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login

  def logged_in?
    !current_user.nil?
  end

  private

  def not_authenticated
    falsh[:warning] = t('default.message.require_login')
    redirect_to login_path
  end
end
