require 'rails_helper'

RSpec.describe CityService do
  describe '.search_cities_by_name' do
    context 'when cities are found' do
      let(:city_id) { 141 }
      let(:api_response) do
        [
          {
            "id" => city_id,
            "slug" => "chihuahua",
            "city_slug" => "chihuahua",
            "display" => "Chihuahua",
            "ascii_display" => "chihuahua",
            "city_name" => "Chihuahua",
            "city_ascii_name" => "chihuahua",
            "state" => "Chihuahua",
            "country" => "México",
            "lat" => "28.6329957",
            "long" => "-106.0691004",
            "result_type" => "city",
            "popularity" => "0.0742471115600732",
            "sort_criteria" => 0.269698830318915
          }
        ]
      end
      let(:expected_cities) do
        [
          City.new(
            id: city_id,
            name: 'Chihuahua',
            state: 'Chihuahua',
            country: 'México',
            coordinates: Coordinates.new(lat: '28.6329957', long: '-106.0691004')
          )
        ]
      end

      before do
        allow(ReservamosApiClient).to receive(:search_cities_by_name).and_return(api_response)
      end

      it 'returns the matching cities' do
        result = CityService.search_cities_by_name("Chi")
        expect(result.map(&:to_h)).to eq(expected_cities.map(&:to_h))
      end
    end

    context 'when no cities are found' do
      before do
        allow(ReservamosApiClient).to receive(:search_cities_by_name).and_return([])
      end

      it 'returns an empty array' do
        result = CityService.search_cities_by_name('UnknownCity')
        expect(result).to eq([])
      end
    end
  end
end
