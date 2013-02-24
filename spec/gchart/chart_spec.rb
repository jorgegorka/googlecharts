require 'spec_helper'

describe Gchart::Chart do
  # This should be a shared example eventually
  subject { Gchart::Line.new }

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
    end
  end
end

