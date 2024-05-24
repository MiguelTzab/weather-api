module Api
  module V1
    class WeatherController < ApplicationController
      def search_cities_weather
        cities = CityService.search_cities_by_name(params[:name])
        render json: cities, status: :created
      rescue StandardError => e
        render json: { error: e.message, trace: e.backtrace.join("\n\t") }, status: :unprocessable_entity
      end
    end
  end
end
