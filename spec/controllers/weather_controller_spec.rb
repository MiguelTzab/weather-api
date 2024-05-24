require 'rails_helper'

RSpec.describe Api::V1::WeatherController, type: :controller do
  describe "GET #search_cities_weather" do
    context "when cities are found" do
      let(:city_id) { 141 }
      let(:cities) do
        [
          City.new(
            id: city_id,
            name: "Chihuahua",
            state: "Chihuahua",
            country: "México",
            coordinates: Coordinates.new(lat: "28.6329957", long: "-106.0691004" )
          )
        ]
      end

      let(:forecasts) do
        {
          city_id => [
            Forecast.new(dt: 1716577200, temp_max: 35.5, temp_min: 18.29)
          ]
        }
      end

      before do
        allow(CityService).to receive(:search_cities_by_name).and_return(cities)
        allow(WeatherService).to receive(:get_forecast).and_return(forecasts)
      end

      it "returns a successful response" do
        get :search_cities_weather, params: { name: 'Chi' }
        expect(response).to be_successful
      end

      it "returns the matching cities with their weather forecast" do
        get :search_cities_weather, params: { name: 'Chi' }
        json_response = JSON.parse(response.body)
        expected_response = cities.map do |city|
          {
            "id" => city.id,
            "name" => city.name,
            "state" => city.state,
            "country" => city.country,
            "coordinates" => {
              "lat" => city.coordinates.lat,
              "long" => city.coordinates.long
            },
            "forecasts" => city.forecasts.map do |forecast|
              {
                "dt" => forecast.dt,
                "temp_max" => forecast.temp_max,
                "temp_min" => forecast.temp_min
              }
            end
          }
        end

        expect(json_response).to eq(expected_response.as_json)
      end
    end

    context "when no cities are found" do
      before do
        allow(CityService).to receive(:search_cities_by_name).and_return([])
      end

      it "returns a successful response" do
        get :search_cities_weather, params: { name: 'UnknownCity' }
        expect(response).to be_successful
        expect(response).to have_http_status(:no_content)
      end

      it "returns an empty array" do
        get :search_cities_weather, params: { name: 'UnknownCity' }
        json_response = JSON.parse(response.body)
        expect(json_response).to eq([])
      end
    end
  end
end
