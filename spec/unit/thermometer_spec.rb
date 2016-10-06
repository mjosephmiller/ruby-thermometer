require '././thermometer'

describe Thermometer do

  subject(:thermo){described_class.new('new_york_city')}

  describe '#initialize' do
    it 'should initialize with no temperature' do
      expect(thermo.temperature).to eq([])
    end
  end

  describe '#get_temp' do
    it 'should return the weather in New York City' do
      thermo.get_temp
      expect(thermo.weather_hash).to be_an_instance_of(Hash)
    end
  end

  describe '#assign_values' do
    it 'should return the temperature in New York City' do
      thermo.get_temp
      thermo.assign_values
      expect(thermo.temperature).to be_an_instance_of(String)
      expect(thermo.temperature).not_to eq([])
    end
  end
end
