Rails.application.routes.draw do
  post 'refresh', action: :get, controller: 'eventbrite'
  get 'index', action: :index, controller: 'eventbrite'
  get 'event_data', action: :event_data, controller: 'eventbrite'

  get 'users/new', to: 'users#new'
  get 'users/index', to: 'users#index'
  post 'users/create', to: 'users#create'

  get 'session/new', to: 'session#new'
  post 'session/create', to: 'session#create'
  post 'session/destroy', to: 'session#destroy'

  root 'eventbrite#index'
end
