require 'net/http'
require 'json'

class ReservamosApiClient
  API_BASE_URL = 'https://search.reservamos.mx/api/v2'.freeze

  def self.search_cities_by_name(name)
    uri = URI("#{API_BASE_URL}/places?q=#{URI.encode_www_form_component(name)}")
    response = Net::HTTP.get_response(uri)

    if response.is_a?(Net::HTTPSuccess)
      parse_response(response.body)
    else
      raise "Failed to fetch cities: #{response.code} #{response.message}"
    end
  end

  private

  def self.parse_response(response_body)
    json_response = JSON.parse(response_body)
    json_response.select { |row| row['result_type'] == 'city' }
  end
end
