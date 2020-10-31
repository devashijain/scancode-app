class Api::V1::SessionsController <Devise::SessionsController
before_action :sign_in_params, only: :create
before_action :load_user, only: :create
before_action :valid_token, only: :destroy
skip_before_action :verify_signed_out_user, only: :destroy
before_action :get_all_users, only: :index

#sign_in
def create
  if @user.valid_password?(sign_in_params[:password])
        sign_in "user", @user
        render json: {
          status: 'SUCCESS',
          messages: "Signed in Successfully",
          is_success: true,
          data: {user: @user}
        }, status: :ok
      else
        render json: {
          status: 'ERROR',
          messages: "Signed In Failed - Unauthorized",
          is_success: false,
          data: {}
        }, status: :unauthorized
      end
end

#log_out
def destroy
      sign_out @user
      @user.generate_new_authentication_token
      render json: {
      status: 'SUCCESS',
      messages: "Signed out Successfully",
      is_success: true,
      data: {}
      }, status: :ok
end


#view users
def index
  @user = User.all;
  render json: {
    status: 'SUCCESS',
    messages: "Users Loaded",
    is_success: true,
    data: {user: @user}
  }, status: :ok
end



private
def sign_in_params
  params.require(:sign_in).permit(:email, :password)
end



def get_all_users
  @user = User.all
  if @user
    return @user
  else
    render json: {
        status: 'ERROR',
        messages: "No users",
        is_success: false,
        data: {}
      }, status: :bad_request
  end
end

def load_user
    @user = User.find_for_database_authentication(email: sign_in_params[:email])
    if @user
      return @user
    else
      render json: {
          status: 'ERROR',
          messages: "Cannot get user",
          is_success: false,
          data: {}
        }, status: :bad_request
    end
  end

  def valid_token
     @user = User.find_by authentication_token: request.headers["AUTH-TOKEN"]
     if @user
       return @user
     else
       render json: {
          status: 'ERROR',
           messages: "Invalid token",
           is_success: false,
           data: {}
         }, status: :bad_request
     end
   end
end
