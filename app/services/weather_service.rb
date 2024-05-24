class WeatherService
  def self.get_forecast_by_coordinates(coordinates)
    forecast_data = OpenWeatherMapApiClient.search_forecast_by_coordinates(coordinates.lat, coordinates.long)
    Forecast.map_to_collection(forecast_data)
  end
end
