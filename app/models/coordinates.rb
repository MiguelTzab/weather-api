class Coordinates
  attr_accessor :lat, :long

  def initialize(lat:, long:)
    @lat = lat
    @long = long
  end

  def as_json(options = {})
    {
      lat: @lat,
      long: @long
    }
  end
end
