class UsersController < ApplicationController
#before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end
  end
end