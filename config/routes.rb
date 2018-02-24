Rails.application.routes.draw do
  root to: "institutions#index"
  resources :institutions
  resources :courses
end
