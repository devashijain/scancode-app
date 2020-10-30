class Api::V1::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_params_exist, only: :create
  #before_action :passwords_match, only: :create
  #sign_up
  def create
    user = User.new user_params
    if user.save
      render json: {
          status: 'SUCCESS',
          messages: "Signed Up Successfully",
          is_success: true,
          data: {user: user}
        }, status: :ok
      else
        render json: {
          status: 'ERROR',
          messages: "Sign Up Failed",
          is_success: false,
          data: {}
        }, status: :unprocessable_entity
      end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end


  def ensure_params_exist
    return if params[:user].present?
   render json: {
       status: 'ERROR',
       messages: "Missing Params",
       is_success: false,
       data: {}
     }, status: :bad_request
 end


  # if params[:password].blank?
  #           params.delete(:password)
  #           params.delete(:password_confirmation) if params[:password_confirmation].blank?
  #         end
  #
  # def passwords_match
  #    if (params[:password].present? && params[:password].eql?[:password_confirmation])
  #     render json: {
  #         messages: "Password mismatch",
  #         is_success: false,
  #         data: {}
  #       }, status: :bad_request
  #   end
  end
