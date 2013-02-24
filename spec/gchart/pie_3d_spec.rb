require 'spec_helper'

describe Gchart::Pie3d do
  describe :methods do
    describe :type do
      it 'should return pie 3d type' do
        described_class.new.type.should == 'p3'
      end
    end
  end

  it "should create a new 3d pie" do
    described_class.new(
      :title => 'Chart Title',
      :legend => ['first data set label', 'n data set label'],
      :data => [12,8,40,15,5]
    ).draw.should include('cht=p3')
  end
end
