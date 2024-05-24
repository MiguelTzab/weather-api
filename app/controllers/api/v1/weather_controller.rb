module Api
  module V1
    class WeatherController < ApplicationController
      def search_cities_weather
        cities = CityService.search_cities_by_name(params[:name])
        cities.each do |city|
          city.forecasts = WeatherService.get_forecast_by_coordinates(city.coordinates)
        end
        render json: cities.as_json, status: :created
      rescue StandardError => e
        render json: { error: e.message }, status: :unprocessable_entity
      end
    end
  end
end
