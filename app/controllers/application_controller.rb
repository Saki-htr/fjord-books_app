# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action do
    I18n.locale = :ja
  end
  def after_sign_up_path_for(resource)
    '/users'
  end
  def after_sign_in_path_for(resource)
    '/users'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:postal_code,:address, :description])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username,:postal_code,:address, :description])
  end
end

