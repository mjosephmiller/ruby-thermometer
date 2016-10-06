require './thermometer'

describe Thermometer do

  subject(:thermo){described_class.new}

  describe '#initialize' do
    it 'should initialize with no temperature' do
      expect(thermo.temperature).to eq([])
    end
  end

end
