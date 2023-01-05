class ApplicationController < ActionController::Base
  rescue_from ActionController::Redirecting::UnsafeRedirectError do
    redirect_to root_url
  end
  add_flash_types :info, :error, :success

  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name discord])
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name discord])
  end
  def after_sign_up_path_for(resource)
    flash[:success] = "Account created and signed in"
    sign_in(resource)
    root_path
  end

  def after_sign_in_path_for(resource)
    root_path
    flash[:success] = "Signed in"
  end
end
