Rails.application.routes.draw do
  root to: 'tools#index'
  resources :tools do
    resources :versions
  end
end
