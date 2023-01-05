class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :success
  def after_sign_in_path_for(resource)
    flash[:success] = "Signed in"
    root_path
  end


  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name discord])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name discord])
  end

end
