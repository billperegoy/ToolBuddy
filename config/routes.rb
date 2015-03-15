Rails.application.routes.draw do
  root to: 'tools#index'

  resources :sites
  resources :tools do
    resources :versions do
      resources :installations
    end
  end

  post '/tools/:tool_id/versions/:version_id/installations/:id',
    to: 'installations#install_one',
    as: 'tool_install_one'

  post '/tools/:tool_id/versions/:version_id',
    to: 'installations#install_all',
    as: 'tool_install_all'
end
