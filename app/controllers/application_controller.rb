class ApplicationController < ActionController::Base
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :fullname
    devise_parameter_sanitizer.for(:account_update) << :fullname << :phone_number << :description
  end
end
