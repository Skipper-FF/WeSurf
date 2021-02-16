class ApplicationController < ActionController::Base

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :fullname
    devise_parameter_sanitizer.for(:account_update) << :fullname << :phone_number << :description
  end

  def pundit_user
    AuthorizationContext.new(current_user, current_organization)
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
