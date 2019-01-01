class UsersController < ApplicationController

  protected

 def configure_account_update_params
  devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar, :avatar_cache, :remove_avatar])
 end

  def index
  end

  def show
  end
end
