Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :weather, only: [] do
        collection do
          get 'cities', to: 'weather#search_cities_weather'
        end
      end
    end
  end

  root to: 'errors#not_found'
end
