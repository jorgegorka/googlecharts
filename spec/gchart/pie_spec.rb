require 'spec_helper'

describe Gchart::Pie do
  describe :methods do
    describe :type do
      it  'should return Pie type' do
        described_class.new.type.should == 'p'
      end
    end
  end

  it "should be able to generate a Pie Chart" do
    described_class.new.draw.should be_an_instance_of(String)
    described_class.new.draw.should include('cht=p')
  end

  it 'should generate different labels and legend' do
    described_class.new(:legend => %w(1 2 3), :labels=>%w(one two three)).draw.should(include('chdl=1|2|3') && include('chl=one|two|three'))
  end
end
