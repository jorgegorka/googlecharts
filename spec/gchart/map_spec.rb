require 'spec_helper'

describe Gchart::Map do
  describe :methods do
    describe :type do
      it 'should return the map type' do
        described_class.new.type.should == 't'
      end
    end
  end

  it "should be able to generate a map chart" do
    Gchart::Map.new.draw.should be_an_instance_of(String)
    Gchart::Map.new.draw.should include('cht=t')
  end

  before(:each) do
    data = [0,100,50,32]
    geographical_area = 'usa'
    map_colors = ['FFFFFF', 'FF0000', 'FFFF00', '00FF00']
    country_codes = ['MT', 'WY', "ID", 'SD']

    @chart = Gchart::Map.new(
      :data => data,
      :encoding => 'text',
      :size => '400x300',
      :geographical_area => geographical_area,
      :map_colors => map_colors,
      :country_codes => country_codes
    ).draw
  end

  it "should create a map" do
    @chart.should include('cht=t')
  end

  it "should set the geographical area" do
    @chart.should include('chtm=usa')
  end

  it "should set the map colors" do
    @chart.should include('chco=FFFFFF,FF0000,FFFF00,00FF00')
  end

  it "should set the country/state codes" do
    @chart.should include('chld=MTWYIDSD')
  end

  it "should set the chart data" do
    @chart.should include('chd=t:0,100,50,32')
  end
end
