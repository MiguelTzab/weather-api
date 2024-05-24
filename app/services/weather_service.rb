class WeatherService
  def self.get_forecast(cities)
    forecasts = []

    threads = cities.map do |city|
      Thread.new do
        forecast_data = OpenWeatherMapApiClient.search_forecast_by_coordinates(city.coordinates.lat, city.coordinates.long)
        forecasts[city.id] = Forecast.map_to_collection(forecast_data)
      end
    end
    threads.each(&:join)

    forecasts
  end
end
