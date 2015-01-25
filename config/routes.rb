Rails.application.routes.draw do
  root to: 'tools#index'

  resources :sites
  resources :tools do
    resources :versions do
      resources :installations
    end
  end
end
