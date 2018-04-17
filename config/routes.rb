Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get   'event-key',                to: 'main#new_event_key'
  post  'save-data/:event_key',     to: 'main#save_data'
  get   'download-data/:event_key', to: 'main#download_data'

  root 'main#home'
end
