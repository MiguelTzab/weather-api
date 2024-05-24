class CityService
  def self.search_cities_by_name(name)
    city_data = ReservamosApiClient.search_cities_by_name(name)
    City.map_to_collection(city_data)
  end
end
