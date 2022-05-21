class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      #send email
      PasswordMailer.with(user: @user).reset.deliver_now
    end

    redirect_to root_path, notice: "If you have an accout, we have sent an email to reset your password!"
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
     rescue ActiveSupport::MessageVerifier::InvalidSignature
      redirect_to sign_in_path, alert: "Your token has expired"
  end

  def update
    @user = User.find_signed(token: params[:token], purpose: "password_reset")

    if @user.update(password_params)
      redirect_to sign_in_path, notice: "Password reset correctly!"
    else
      render :edit
    end
  end


  private
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end