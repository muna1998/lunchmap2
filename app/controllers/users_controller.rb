class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
     @user = User.find_by(id: params[:id])
  end

  protected

 def configure_account_update_params
  devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar, :avatar_cache, :remove_avatar])
 end
end
