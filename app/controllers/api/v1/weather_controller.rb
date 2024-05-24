module Api
  module V1
    class WeatherController < ApplicationController
      def search_cities_weather
        cities = CityService.search_cities_by_name(params[:name])

        unless cities.any?
          return render json: [], status: :no_content
        end

        forecasts = WeatherService.get_forecast(cities)

        cities.each do |city|
          city.forecasts = forecasts[city.id]
        end

        render json: cities.as_json, status: :ok
      rescue StandardError => e
        render json: { error: e.message }, status: :internal_server_error
      end
    end
  end
end
