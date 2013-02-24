require 'spec_helper'

describe Gchart::Meter do
  subject { described_class.new }
  describe :methods do
    describe :type do
      it 'should return Meter type' do
        subject.type.should == 'gom'
      end
    end
  end

  it "should be able to generate a Google-O-Meter" do
    described_class.new.draw.should be_an_instance_of(String)
    described_class.new.draw.should include('cht=gom')
  end

  describe 'non refactored tests' do
    before(:each) do
      @data = [70]
      @legend = ['arrow points here']
      @jstized_legend = Gchart::Gchart.jstize(@legend.join('|'))
      @chart = described_class.new(:data => @data).draw
    end

    it "should create a meter" do
      @chart.should include('cht=gom')
    end

    it "should be able to set a solid background fill" do
      described_class.new(:bg => 'efefef').draw.should include("chf=bg,s,efefef")
      described_class.new(:bg => {:color => 'efefef', :type => 'solid'}).draw.should include("chf=bg,s,efefef")
    end

    it "should be able to set labels by using the labels accessor" do
      described_class.new(:title => @title, :labels => @legend, :data => @data).draw.should include("chl=#{@jstized_legend}")
    end

    it "should be able to set labels by using the legend accessor" do
      described_class.new(:title => @title, :legend => @legend, :data => @data).draw.should include("chl=#{@jstized_legend}")
    end
  end
end
