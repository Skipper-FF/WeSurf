class ApplicationController < ActionController::Base

  before_action :authenticate_user!, only: :home
  include Pundit

  def home
  end

  after_action :verify_authorized, except: [:show, :index], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :fullname
    devise_parameter_sanitizer.for(:account_update) << :fullname << :phone_number << :description
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

end
