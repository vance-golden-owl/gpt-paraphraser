class ApiKeysController < ApplicationController
  before_action :authenticate_user!
  before_action :prepare_user

  def index 
    @api_keys = @user.api_keys
  end

  def new 
    @api_key = ApiKey.new
  end
  
  def create
    token = SecureRandom.hex 
    api_key = @user.api_keys.create! token: token, name: permitted_params[:name]

    flash[:info] = "API key created, please make sure to copy your token, as it will be displayed only once. Your token is: #{token}"
    redirect_to user_api_keys_path(current_user)
  end
  
  def destroy
    api_key = current_user.api_keys.find(params[:id]) 
    api_key.destroy 

    flash[:notice] = "API key deleted"
    redirect_to user_api_keys_path(current_user)
  end

  private 

  def prepare_user 
    @user = User.find(params[:user_id])
  end

  def permitted_params 
    params.require(:api_key).permit(:name)
  end
end