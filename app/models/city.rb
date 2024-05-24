class City
  attr_accessor :id, :name, :state, :country, :coordinates, :forecasts

  def initialize(id:, name:, state:, country:, coordinates:, forecasts: [])
    @id = id
    @name = name
    @state = state
    @country = country
    @coordinates = coordinates
    @forecast = forecasts
  end

  def as_json(options = {})
    coordinates = { lat: @lat, long: @long}
    {
      id: @id,
      name: @name,
      state: @state,
      country: @country,
      coordinates: @coordinates.as_json,
      forecasts: @forecasts.map(&:as_json)
    }
  end

  def self.map_to_city(data)
    coordinates = Coordinates.new(lat: data['lat'], long: data['long']);

    City.new(
      id: data['id'],
      name: data['city_name'],
      state: data['state'],
      country: data['country'],
      coordinates: coordinates,
      forecasts: []
    )
  end

  def self.map_to_collection(cities)
    cities.map { |city_data| map_to_city(city_data) }
  end
end