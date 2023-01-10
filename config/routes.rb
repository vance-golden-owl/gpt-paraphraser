Rails.application.routes.draw do
  devise_for :users
  root "dashboard#index"

  post "translate", to: "dashboard#translate"
  post "paraphrase", to: "dashboard#paraphrase"
  post "chat", to: "dashboard#chat"

  resources :users, only: [] do 
    resources :api_keys, only: %i[index new create destroy]
  end

  namespace :api do 
    namespace :v1 do 
      resources :api_keys, only: %i[index create destroy]
      
      post "translate", to: "dashboard#translate"
      post "paraphrase", to: "dashboard#paraphrase"
      post "chat", to: "dashboard#chat"
    end
  end

  telegram_webhook Webhooks::TelegramBotController
end
