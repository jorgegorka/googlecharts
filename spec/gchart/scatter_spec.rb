require 'spec_helper'

describe Gchart::Scatter do
  describe :methods do
    describe :type do
      it 'should return scatter type' do
        described_class.new.type.should == 's'
      end
    end
  end

  it "should be able to generate a scatter chart" do
    described_class.new.draw.should be_an_instance_of(String)
    described_class.new.draw.should include('cht=s')
  end
end
