class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def authorise_admin!
    logged_in? && current_user.admin?
  end
end