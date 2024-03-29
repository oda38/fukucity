# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインしました。"
    root_path
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトしました。"
    root_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

   protected

  #退会後のログインを阻止
   def reject_user
    @user = User.find_by(name: params[:user][:email])
    if @user 
      if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == false)
        redirect_to new_user_registration_path
      end
    end
   end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
