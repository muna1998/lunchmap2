class Users::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    super
  end


      def destroy
        @user=User.find_by(id: params[:id])
        @user.avatar.destroy
      end

end
