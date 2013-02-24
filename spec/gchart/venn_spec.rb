require 'spec_helper'

describe Gchart::Venn do
  describe :methods do
    describe :type do
      it 'should return Venn type' do
        described_class.new.type.should == 'v'
      end
    end
  end

  it "should be able to generate a Venn diagram" do
    described_class.new.draw.should be_an_instance_of(String)
    described_class.new.draw.should include('cht=v')
  end
end
