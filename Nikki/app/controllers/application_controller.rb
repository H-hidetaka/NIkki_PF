class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  def logged_in?
    !current_user.nil?
  end
end
