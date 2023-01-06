module Api 
  module V1 
    class ApiKeysController < ApplicationController
      include ApiKeyAuthenticatable 
      
      prepend_before_action :authenticate_with_api_key!, only: %i[index destroy]

      def index
        render json: current_bearer.api_keys
      end
     
      def create
        authenticate_with_http_basic do |email, password|
          user = User.find_by email: email
     
          if user&.valid_password?(password)
            api_key = user.api_keys.create! token: SecureRandom.hex, name: "API generated key #{Time.now.strftime('%M-%H-%d-%m-%Y')}"
     
            render json: api_key, status: :created and return
          end
        end
     
        render json: { error: "Unable to login with provided credentials" }, status: :unauthorized
      end
     
      def destroy
        api_key = current_bearer.api_keys.find(params[:id]) 
        api_key.destroy 

        render json: { message: "API key \"#{api_key.name}\" was destroyed successfully" }
      end
    end
  end
end