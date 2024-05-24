require 'net/http'
require 'json'

class OpenWeatherMapApiClient
  API_BASE_URL = ENV['OPEN_WEATHER_MAP_API_BASE_URL']
  API_KEY = ENV['OPEN_WEATHER_MAP_API_KEY']
  METRIC = ENV['OPEN_WEATHER_MAP_API_METRIC'] || 'metric'

  def self.search_forecast_by_coordinates(lat, long)
    uri = URI("#{API_BASE_URL}/onecall?lat=#{lat}&lon=#{long}&exclude=current,hourly,minutely,alerts&appid=#{API_KEY}&units=#{METRIC}")
    puts uri
    response = Net::HTTP.get_response(uri)

    if response.is_a?(Net::HTTPSuccess)
      parse_response(response.body)
    else
      raise "Failed to fetch forecast: #{response.code} #{response.message}"
    end
  end

  private

  def self.parse_response(response_body)
    json_response = JSON.parse(response_body)
    json_response['daily'].first(7)
  end
end
