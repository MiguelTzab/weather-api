require 'rails_helper'

RSpec.describe WeatherService, type: :service do
  describe '.get_forecast' do
    let(:city1) do
      City.new(
        id: 1,
        name: 'City1',
        state: 'State1',
        country: 'Country1',
        coordinates: Coordinates.new(lat: '10.0', long: '20.0'),
        forecasts: []
      )
    end

    let(:city2) do
      City.new(
        id: 2,
        name: 'City2',
        state: 'State2',
        country: 'Country2',
        coordinates: Coordinates.new(lat: '30.0', long: '40.0'),
        forecasts: []
      )
    end

    let(:cities) { [city1, city2] }

    let(:forecast_response_city1) do
      {
        "lat": 28.633,
        "lon": -106.0691,
        "timezone": "America/Chihuahua",
        "timezone_offset": -21600,
        "daily": [
            {
                "dt": 1716577200,
                "sunrise": 1716552543,
                "sunset": 1716602018,
                "moonrise": 1716607800,
                "moonset": 1716554520,
                "moon_phase": 0.54,
                "temp": {
                    "day": 29.67,
                    "min": 18.29,
                    "max": 34.86,
                    "night": 25.04,
                    "eve": 32.56,
                    "morn": 19.64
                },
                "feels_like": {
                    "day": 27.99,
                    "night": 23.78,
                    "eve": 30.44,
                    "morn": 17.95
                },
                "pressure": 1010,
                "humidity": 5,
                "dew_point": -12.47,
                "wind_speed": 10.05,
                "wind_deg": 275,
                "wind_gust": 16.01,
                "weather": [
                    {
                        "id": 800,
                        "main": "Clear",
                        "description": "clear sky",
                        "icon": "01d"
                    }
                ],
                "clouds": 7,
                "pop": 0,
                "uvi": 13.47
            },
            {
                "dt": 1716663600,
                "sunrise": 1716638922,
                "sunset": 1716688452,
                "moonrise": 1716697740,
                "moonset": 1716644160,
                "moon_phase": 0.57,
                "temp": {
                    "day": 35.23,
                    "min": 19.3,
                    "max": 36.46,
                    "night": 25.33,
                    "eve": 32.27,
                    "morn": 20.72
                },
                "feels_like": {
                    "day": 32.49,
                    "night": 24.34,
                    "eve": 29.99,
                    "morn": 19.16
                },
                "pressure": 1006,
                "humidity": 7,
                "dew_point": -6.05,
                "wind_speed": 12.16,
                "wind_deg": 274,
                "wind_gust": 16.32,
                "weather": [
                    {
                        "id": 803,
                        "main": "Clouds",
                        "description": "broken clouds",
                        "icon": "04d"
                    }
                ],
                "clouds": 72,
                "pop": 0,
                "uvi": 13.96
            },
            {
                "dt": 1716750000,
                "sunrise": 1716725302,
                "sunset": 1716774886,
                "moonrise": 1716787380,
                "moonset": 1716734160,
                "moon_phase": 0.61,
                "temp": {
                    "day": 34.27,
                    "min": 20.5,
                    "max": 35.8,
                    "night": 26.23,
                    "eve": 33.06,
                    "morn": 21.4
                },
                "feels_like": {
                    "day": 31.68,
                    "night": 26.23,
                    "eve": 30.67,
                    "morn": 20.2
                },
                "pressure": 1009,
                "humidity": 8,
                "dew_point": -4.86,
                "wind_speed": 10.39,
                "wind_deg": 283,
                "wind_gust": 15.9,
                "weather": [
                    {
                        "id": 801,
                        "main": "Clouds",
                        "description": "few clouds",
                        "icon": "02d"
                    }
                ],
                "clouds": 18,
                "pop": 0,
                "uvi": 13.67
            },
            {
                "dt": 1716836400,
                "sunrise": 1716811683,
                "sunset": 1716861319,
                "moonrise": 0,
                "moonset": 1716824460,
                "moon_phase": 0.64,
                "temp": {
                    "day": 31.81,
                    "min": 19.93,
                    "max": 35.52,
                    "night": 30.29,
                    "eve": 35.52,
                    "morn": 21.87
                },
                "feels_like": {
                    "day": 29.62,
                    "night": 28.41,
                    "eve": 32.73,
                    "morn": 20.58
                },
                "pressure": 1013,
                "humidity": 9,
                "dew_point": -5.96,
                "wind_speed": 8.57,
                "wind_deg": 279,
                "wind_gust": 15.56,
                "weather": [
                    {
                        "id": 801,
                        "main": "Clouds",
                        "description": "few clouds",
                        "icon": "02d"
                    }
                ],
                "clouds": 15,
                "pop": 0,
                "uvi": 13.11
            },
            {
                "dt": 1716922800,
                "sunrise": 1716898065,
                "sunset": 1716947752,
                "moonrise": 1716876660,
                "moonset": 1716914880,
                "moon_phase": 0.68,
                "temp": {
                    "day": 32.99,
                    "min": 22.72,
                    "max": 36.69,
                    "night": 30.47,
                    "eve": 36.69,
                    "morn": 22.72
                },
                "feels_like": {
                    "day": 30.63,
                    "night": 28.58,
                    "eve": 33.69,
                    "morn": 21.31
                },
                "pressure": 1013,
                "humidity": 7,
                "dew_point": -8.17,
                "wind_speed": 7.39,
                "wind_deg": 299,
                "wind_gust": 13.35,
                "weather": [
                    {
                        "id": 801,
                        "main": "Clouds",
                        "description": "few clouds",
                        "icon": "02d"
                    }
                ],
                "clouds": 17,
                "pop": 0,
                "uvi": 14
            },
            {
                "dt": 1717009200,
                "sunrise": 1716984449,
                "sunset": 1717034184,
                "moonrise": 1716965580,
                "moonset": 1717005240,
                "moon_phase": 0.71,
                "temp": {
                    "day": 33.33,
                    "min": 22.36,
                    "max": 36.33,
                    "night": 30.17,
                    "eve": 35.93,
                    "morn": 22.36
                },
                "feels_like": {
                    "day": 30.88,
                    "night": 28.32,
                    "eve": 33.08,
                    "morn": 20.99
                },
                "pressure": 1012,
                "humidity": 10,
                "dew_point": -3.15,
                "wind_speed": 10.75,
                "wind_deg": 287,
                "wind_gust": 16.53,
                "weather": [
                    {
                        "id": 800,
                        "main": "Clear",
                        "description": "clear sky",
                        "icon": "01d"
                    }
                ],
                "clouds": 0,
                "pop": 0,
                "uvi": 14
            },
            {
                "dt": 1717095600,
                "sunrise": 1717070834,
                "sunset": 1717120615,
                "moonrise": 1717054200,
                "moonset": 1717095540,
                "moon_phase": 0.75,
                "temp": {
                    "day": 32.09,
                    "min": 20.78,
                    "max": 36.7,
                    "night": 29.38,
                    "eve": 36.32,
                    "morn": 20.78
                },
                "feels_like": {
                    "day": 29.87,
                    "night": 27.71,
                    "eve": 33.38,
                    "morn": 19.36
                },
                "pressure": 1011,
                "humidity": 8,
                "dew_point": -7.3,
                "wind_speed": 10.76,
                "wind_deg": 283,
                "wind_gust": 17.01,
                "weather": [
                    {
                        "id": 801,
                        "main": "Clouds",
                        "description": "few clouds",
                        "icon": "02d"
                    }
                ],
                "clouds": 12,
                "pop": 0,
                "uvi": 14
            },
            {
                "dt": 1717182000,
                "sunrise": 1717157221,
                "sunset": 1717207046,
                "moonrise": 1717142580,
                "moonset": 1717185780,
                "moon_phase": 0.79,
                "temp": {
                    "day": 31.8,
                    "min": 20.85,
                    "max": 36.1,
                    "night": 29.21,
                    "eve": 36.1,
                    "morn": 20.85
                },
                "feels_like": {
                    "day": 29.63,
                    "night": 27.57,
                    "eve": 33.21,
                    "morn": 19.54
                },
                "pressure": 1009,
                "humidity": 8,
                "dew_point": -7.51,
                "wind_speed": 8.11,
                "wind_deg": 290,
                "wind_gust": 14.29,
                "weather": [
                    {
                        "id": 800,
                        "main": "Clear",
                        "description": "clear sky",
                        "icon": "01d"
                    }
                ],
                "clouds": 0,
                "pop": 0,
                "uvi": 14
            }
        ]
      }
    end

    let(:forecast_response_city2) do
      {
        "lat": 18.5002,
        "lon": -88.2961,
        "timezone": "America/Cancun",
        "timezone_offset": -18000,
        "daily": [
            {
                "dt": 1716570000,
                "sunrise": 1716549426,
                "sunset": 1716596603,
                "moonrise": 1716601620,
                "moonset": 1716551700,
                "moon_phase": 0.54,
                "temp": {
                    "day": 31.29,
                    "min": 27.35,
                    "max": 33.03,
                    "night": 27.71,
                    "eve": 32.52,
                    "morn": 27.98
                },
                "feels_like": {
                    "day": 35.21,
                    "night": 31.25,
                    "eve": 39.34,
                    "morn": 30.76
                },
                "pressure": 1011,
                "humidity": 59,
                "dew_point": 22.1,
                "wind_speed": 6.17,
                "wind_deg": 141,
                "wind_gust": 8.64,
                "weather": [
                    {
                        "id": 800,
                        "main": "Clear",
                        "description": "clear sky",
                        "icon": "01d"
                    }
                ],
                "clouds": 3,
                "pop": 0,
                "uvi": 12.74
            },
            {
                "dt": 1716656400,
                "sunrise": 1716635816,
                "sunset": 1716683026,
                "moonrise": 1716691620,
                "moonset": 1716641400,
                "moon_phase": 0.57,
                "temp": {
                    "day": 31.54,
                    "min": 27.41,
                    "max": 32.04,
                    "night": 27.9,
                    "eve": 30.8,
                    "morn": 28.4
                },
                "feels_like": {
                    "day": 36.88,
                    "night": 31.7,
                    "eve": 36.22,
                    "morn": 32.09
                },
                "pressure": 1011,
                "humidity": 63,
                "dew_point": 23.58,
                "wind_speed": 5.78,
                "wind_deg": 109,
                "wind_gust": 8.97,
                "weather": [
                    {
                        "id": 802,
                        "main": "Clouds",
                        "description": "scattered clouds",
                        "icon": "03d"
                    }
                ],
                "clouds": 30,
                "pop": 0,
                "uvi": 12.34
            },
            {
                "dt": 1716742800,
                "sunrise": 1716722206,
                "sunset": 1716769449,
                "moonrise": 1716781380,
                "moonset": 1716731340,
                "moon_phase": 0.61,
                "temp": {
                    "day": 31.7,
                    "min": 27.7,
                    "max": 32.07,
                    "night": 27.96,
                    "eve": 30.97,
                    "morn": 28.52
                },
                "feels_like": {
                    "day": 36.38,
                    "night": 32.31,
                    "eve": 36.08,
                    "morn": 31.71
                },
                "pressure": 1011,
                "humidity": 60,
                "dew_point": 22.99,
                "wind_speed": 6.29,
                "wind_deg": 114,
                "wind_gust": 8.96,
                "weather": [
                    {
                        "id": 801,
                        "main": "Clouds",
                        "description": "few clouds",
                        "icon": "02d"
                    }
                ],
                "clouds": 15,
                "pop": 0,
                "uvi": 12.67
            },
            {
                "dt": 1716829200,
                "sunrise": 1716808598,
                "sunset": 1716855872,
                "moonrise": 1716870900,
                "moonset": 1716821520,
                "moon_phase": 0.64,
                "temp": {
                    "day": 32.14,
                    "min": 27.68,
                    "max": 32.39,
                    "night": 28.27,
                    "eve": 30.08,
                    "morn": 28.96
                },
                "feels_like": {
                    "day": 38.36,
                    "night": 33.67,
                    "eve": 35.99,
                    "morn": 32.82
                },
                "pressure": 1013,
                "humidity": 63,
                "dew_point": 24.18,
                "wind_speed": 6.09,
                "wind_deg": 116,
                "wind_gust": 8.93,
                "weather": [
                    {
                        "id": 801,
                        "main": "Clouds",
                        "description": "few clouds",
                        "icon": "02d"
                    }
                ],
                "clouds": 20,
                "pop": 0,
                "uvi": 12.51
            },
            {
                "dt": 1716915600,
                "sunrise": 1716894990,
                "sunset": 1716942295,
                "moonrise": 0,
                "moonset": 1716911640,
                "moon_phase": 0.68,
                "temp": {
                    "day": 32.49,
                    "min": 27.69,
                    "max": 32.49,
                    "night": 28.09,
                    "eve": 30.25,
                    "morn": 28.04
                },
                "feels_like": {
                    "day": 38.24,
                    "night": 32.81,
                    "eve": 36.18,
                    "morn": 32.68
                },
                "pressure": 1013,
                "humidity": 60,
                "dew_point": 23.72,
                "wind_speed": 5.86,
                "wind_deg": 108,
                "wind_gust": 9.71,
                "weather": [
                    {
                        "id": 500,
                        "main": "Rain",
                        "description": "light rain",
                        "icon": "10d"
                    }
                ],
                "clouds": 34,
                "pop": 0.2,
                "rain": 0.13,
                "uvi": 12.69
            },
            {
                "dt": 1717002000,
                "sunrise": 1716981384,
                "sunset": 1717028718,
                "moonrise": 1716960120,
                "moonset": 1717001700,
                "moon_phase": 0.71,
                "temp": {
                    "day": 32.32,
                    "min": 27.5,
                    "max": 32.32,
                    "night": 27.83,
                    "eve": 29.93,
                    "morn": 27.79
                },
                "feels_like": {
                    "day": 36.9,
                    "night": 31.82,
                    "eve": 34.4,
                    "morn": 31.87
                },
                "pressure": 1014,
                "humidity": 57,
                "dew_point": 22.59,
                "wind_speed": 6.03,
                "wind_deg": 138,
                "wind_gust": 8.75,
                "weather": [
                    {
                        "id": 800,
                        "main": "Clear",
                        "description": "clear sky",
                        "icon": "01d"
                    }
                ],
                "clouds": 1,
                "pop": 0,
                "uvi": 0.21
            },
            {
                "dt": 1717088400,
                "sunrise": 1717067778,
                "sunset": 1717115140,
                "moonrise": 1717049100,
                "moonset": 1717091700,
                "moon_phase": 0.75,
                "temp": {
                    "day": 32.07,
                    "min": 27.29,
                    "max": 32.07,
                    "night": 27.76,
                    "eve": 29.83,
                    "morn": 27.62
                },
                "feels_like": {
                    "day": 36.35,
                    "night": 31.37,
                    "eve": 34.17,
                    "morn": 31.17
                },
                "pressure": 1012,
                "humidity": 57,
                "dew_point": 22.16,
                "wind_speed": 5.47,
                "wind_deg": 106,
                "wind_gust": 8.45,
                "weather": [
                    {
                        "id": 802,
                        "main": "Clouds",
                        "description": "scattered clouds",
                        "icon": "03d"
                    }
                ],
                "clouds": 38,
                "pop": 0,
                "uvi": 1
            },
            {
                "dt": 1717174800,
                "sunrise": 1717154173,
                "sunset": 1717201562,
                "moonrise": 1717137900,
                "moonset": 1717181580,
                "moon_phase": 0.79,
                "temp": {
                    "day": 31.99,
                    "min": 26.88,
                    "max": 32.06,
                    "night": 28,
                    "eve": 30,
                    "morn": 27.3
                },
                "feels_like": {
                    "day": 37.05,
                    "night": 32.1,
                    "eve": 35.28,
                    "morn": 30.88
                },
                "pressure": 1011,
                "humidity": 60,
                "dew_point": 22.77,
                "wind_speed": 5.62,
                "wind_deg": 111,
                "wind_gust": 9.2,
                "weather": [
                    {
                        "id": 500,
                        "main": "Rain",
                        "description": "light rain",
                        "icon": "10d"
                    }
                ],
                "clouds": 36,
                "pop": 0.7,
                "rain": 0.63,
                "uvi": 1
            }
        ]
    }
    end

    let(:mapped_forecasts_city1) do
      [
        Forecast.new(dt: 1716577200, temp_max: 30.5, temp_min: 20.5),
        Forecast.new(dt: 1716663600, temp_max: 32.0, temp_min: 21.0)
      ]
    end

    let(:mapped_forecasts_city2) do
      [
        Forecast.new(dt: 1716577200, temp_max: 25.5, temp_min: 15.5),
        Forecast.new(dt: 1716663600, temp_max: 27.0, temp_min: 16.0)
      ]
    end

    before do
      allow(OpenWeatherMapApiClient).to receive(:search_forecast_by_coordinates).with('10.0', '20.0').and_return(forecast_response_city1)
      allow(OpenWeatherMapApiClient).to receive(:search_forecast_by_coordinates).with('30.0', '40.0').and_return(forecast_response_city2)

      allow(Forecast).to receive(:map_to_collection).with(forecast_response_city1).and_return(mapped_forecasts_city1)
      allow(Forecast).to receive(:map_to_collection).with(forecast_response_city2).and_return(mapped_forecasts_city2)
    end

    it 'returns a hash with city IDs as keys and arrays of Forecast objects as values' do
      result = WeatherService.get_forecast(cities)

      expected_result = {
        1 => mapped_forecasts_city1,
        2 => mapped_forecasts_city2
      }

      expect(result).to eq(expected_result)
    end

    it 'handles client failure' do
      allow(OpenWeatherMapApiClient).to receive(:search_forecast_by_coordinates).with('10.0', '20.0').and_raise(StandardError.new('API client error'))
      allow(OpenWeatherMapApiClient).to receive(:search_forecast_by_coordinates).with('30.0', '40.0').and_return(forecast_response_city2)

      allow(Forecast).to receive(:map_to_collection).with(forecast_response_city2).and_return(mapped_forecasts_city2)

      result = WeatherService.get_forecast(cities)

      expected_result = {
        1 => [],
        2 => mapped_forecasts_city2
      }

      expect(result).to eq(expected_result)
    end
  end
end
