Rails.application.routes.draw do
  root "dashboard#index"

  post "translate", to: "dashboard#translate"
  post "paraphrase", to: "dashboard#paraphrase"
end
