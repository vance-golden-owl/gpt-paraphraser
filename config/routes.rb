Rails.application.routes.draw do
  root "dashboard#index"

  post "translate", to: "dashboard#translate"
  post "paraphrase", to: "dashboard#paraphrase"
  post "chat", to: "dashboard#chat"

  namespace :api do 
    namespace :v1 do 
      post "translate", to: "dashboard#translate"
      post "paraphrase", to: "dashboard#paraphrase"
      post "chat", to: "dashboard#chat"
    end
  end
end
