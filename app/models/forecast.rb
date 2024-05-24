class Forecast
  attr_reader :dt, :temp_max, :temp_min

  def initialize(dt:, temp_max:, temp_min:)
    @dt = dt
    @temp_max = temp_max
    @temp_min = temp_min
  end

  def to_h
    {
      dt: dt,
      temp_max: temp_max,
      temp_min: temp_min
    }
  end

  def as_json(options = {})
    {
      dt: dt,
      temp_max: temp_max,
      temp_min: temp_min,
    }
  end

  def self.map_to_forecast(data)
    Forecast.new(
      dt: data['dt'],
      temp_max: data['temp']['max'],
      temp_min: data['temp']['min']
    )
  end

  def self.map_to_collection(forecasts)
    forecasts.map { |forecast_data| map_to_forecast(forecast_data) }
  end
end
