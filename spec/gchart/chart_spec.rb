require 'spec_helper'

describe Gchart::Chart do
  subject { described_class.new }

  describe :methods do
    describe :width do
      it 'should have a default value of 300' do
        subject.width.should == 300
      end
      it 'can be assigned any value through size' do
        subject.size = '555x666'
        subject.width.should == 555
      end
    end

    describe :height do
      it 'should have a default value of 200' do
        subject.height.should == 200
      end
      it 'can be assigned any value through size' do
        subject.size = '555x666'
        subject.height.should == 666
      end
    end

    describe :size do
      it 'should return the size as width x height' do
        subject.size= '400x300'
        subject.size.should == '400x300'
      end
      it "should have a default size" do
        subject.size.should == '300x200'
      end
      it 'should format size to param' do
        subject.set_size.should == 'chs=300x200'
      end
    end
    describe :legend do
      context 'chart is not a google-o-meter' do
        context 'legend is a sting' do
          described_class.new.set_legend.should == 'chdl='
        end
      end
    end
  end
end

