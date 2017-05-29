Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :feedbacks
  end

  root "posts#index"
end
