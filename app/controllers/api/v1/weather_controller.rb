module Api
  module V1
    class WeatherController < ApplicationController
      def search_cities_weather
        cities = CityService.search_cities_by_name(params[:name])
        forecasts = WeatherService.get_forecast(cities)

        cities.each do |city|
          city.forecasts = forecasts[city.id]
        end

        render json: cities.as_json, status: :created
      rescue StandardError => e
        render json: { error: e.message }, status: :unprocessable_entity
      end
    end
  end
end
