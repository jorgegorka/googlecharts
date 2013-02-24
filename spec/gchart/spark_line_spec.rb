require 'spec_helper'

describe Gchart::SparkLine do
  describe :methods do
    describe :type do
      it 'should return spart line type' do
        described_class.new.type.should == 'ls'
      end
    end
  end

  it "should be able to generate a sparkline chart" do
    Gchart::SparkLine.new.draw.should be_an_instance_of(String)
    Gchart::SparkLine.new.draw.should include('cht=ls')
  end

  before(:each) do
    @title = 'Chart Title'
    @legend = ['first data set label', 'n data set label']
    @jstized_legend = Gchart::Gchart.jstize(@legend.join('|'))
    @data = [27,25,25,25,25,27,100,31,25,36,25,25,39,25,31,25,25,25,26,26,25,25,28,25,25,100,28,27,31,25,27,27,29,25,27,26,26,25,26,26,35,33,34,25,26,25,36,25,26,37,33,33,37,37,39,25,25,25,25]
    @chart = described_class.new(
      :title => @title,
      :data => @data,
      :legend => @legend
    ).draw
  end

  it "should create a sparkline" do
    @chart.should include('cht=ls')
  end

  it 'should be able have a chart title' do
    @chart.should include("chtt=Chart+Title")
  end

  it "should be able to a custom color and size title" do
     described_class.new(:title => @title, :title_color => 'FF0000').draw.should include('chts=FF0000')
     described_class.new(:title => @title, :title_size => '20').draw.should include('chts=454545,20')
  end

  it "should be able to have multiple legends" do
    @chart.should include(Gchart::Gchart.jstize("chdl=first+data+set+label|n+data+set+label"))
  end

  it "should be able to have one legend" do
    chart = described_class.new(:legend => 'legend label')
    chart.draw.should include("chdl=legend+label")
  end

  it "should be able to set the background fill" do
    described_class.new(:bg => 'efefef').draw.should include("chf=bg,s,efefef")
    described_class.new(:bg => {:color => 'efefef', :type => 'solid'}).draw.should include("chf=bg,s,efefef")

    described_class.new(:bg => {:color => 'efefef', :type => 'gradient'}).draw.should include("chf=bg,lg,0,efefef,0,ffffff,1")
    described_class.new(:bg => {:color => 'efefef,0,ffffff,1', :type => 'gradient'}).draw.should include("chf=bg,lg,0,efefef,0,ffffff,1")
    described_class.new(:bg => {:color => 'efefef', :type => 'gradient', :angle => 90}).draw.should include("chf=bg,lg,90,efefef,0,ffffff,1")

    described_class.new(:bg => {:color => 'efefef', :type => 'stripes'}).draw.should include("chf=bg,ls,90,efefef,0.2,ffffff,0.2")
  end

  it "should be able to set a graph fill" do
    described_class.new(:graph_bg => 'efefef').draw.should include("chf=c,s,efefef")
    described_class.new(:graph_bg => {:color => 'efefef', :type => 'solid'}).draw.should include("chf=c,s,efefef")
    described_class.new(:graph_bg => {:color => 'efefef', :type => 'gradient'}).draw.should include("chf=c,lg,0,efefef,0,ffffff,1")
    described_class.new(:graph_bg => {:color => 'efefef,0,ffffff,1', :type => 'gradient'}).draw.should include("chf=c,lg,0,efefef,0,ffffff,1")
    described_class.new(:graph_bg => {:color => 'efefef', :type => 'gradient', :angle => 90}).draw.should include("chf=c,lg,90,efefef,0,ffffff,1")
  end

  it "should be able to set both a graph and a background fill" do
    described_class.new(:bg => 'efefef', :graph_bg => '76A4FB').draw.should match(/chf=(bg,s,efefef\|c,s,76A4FB|c,s,76A4FB\|bg,s,efefef)/)
  end

  it "should be able to have different line colors" do
    described_class.new(:line_colors => 'efefef|00ffff').draw.should include(Gchart::Gchart.jstize('chco=efefef|00ffff'))
    described_class.new(:line_color => 'efefef|00ffff').draw.should include(Gchart::Gchart.jstize('chco=efefef|00ffff'))
  end
end
