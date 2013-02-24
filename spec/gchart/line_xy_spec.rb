require 'spec_helper'

describe Gchart::LineXy do
  describe :methods do
    describe :type do
      it 'should return LineXy type' do
        described_class.new.type.should == 'lxy'
      end
    end
  end

  it "should be able to generate a line xy chart" do
    described_class.new.draw.should be_an_instance_of(String)
    described_class.new.draw.should include('cht=lxy')
  end
end
