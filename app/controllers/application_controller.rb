class ApplicationController < ActionController::Base
  before_action :require_login
  
  add_flash_types :success, :info, :warning, :danger, :notice
  protect_from_forgery with: :exception


  private

  def not_authenticated
    redirect_to login_path
  end
end
