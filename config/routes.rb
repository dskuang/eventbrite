Rails.application.routes.draw do
  post 'refresh', action: :get, controller: 'eventbrite'
  get 'index', action: :index, controller: 'eventbrite'
  get 'event_data', action: :event_data, controller: 'eventbrite'

  root 'eventbrite#index'
end
