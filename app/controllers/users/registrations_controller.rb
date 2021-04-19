# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def after_update_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(_resource)
    new_user_session_path
  end
end
