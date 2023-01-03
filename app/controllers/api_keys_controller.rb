class ApiKeysController < ApplicationController
  before_action :authenticate_user!

  def index; end
  
  def create
    user = User.find_by(email: params[:emai])

    if user&.valid_password?(params[:password])
      api_key = user.api_keys.create! token: SecureRandom.hex
    end
  
  end
  
  def destroy
    api_key = current_bearer.api_keys.find(params[:id]) 
    api_key.destroy 
  end
end