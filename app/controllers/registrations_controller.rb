class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :gender, :city, :state, :admin)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :name, :gender, :city, :state)
  end

end
