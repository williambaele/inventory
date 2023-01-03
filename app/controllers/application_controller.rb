class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :success

  def after_sign_in_path_for(resource)
    flash[:success] = "Signed in"
    root_path
  end
end
