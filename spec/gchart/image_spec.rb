require 'spec_helper'

describe Gchart::Image do
  subject { described_class.new }
  describe :methods do
    describe :image_tag do
      before :each do
        options = {
          :id => 111,
          :klass => 'Line',
          :url => 'http://www.test.com/charts?some_params=333',
          :width => 400,
          :height => 600,
          :alt    => 'Some test image',
          :title  => 'A random title',
          :usemap => 111
        }
        @image = subject.image_tag(options)
      end
      it 'should return a string' do
        @image.should be_a String
      end

      it 'should return an image tag' do
        @image.include?('<img').should be
      end

      it 'should have an id' do
        @image.include?('id="111"').should be
      end

      it 'should have a klass' do
        @image.include?('class="Line"').should be
      end

      it 'should have a url' do
        @image.include?('src="http://www.test.com/charts?some_params=333"').should be
      end

      it 'should have a width' do
        @image.include?('width="400"').should be
      end

      it 'should have a height' do
        @image.include?('height="600"').should be
      end

      it 'should have an alt' do
        @image.include?('alt="Some test image"').should be
      end

      it 'should have a title' do
        @image.include?('title="A random title"').should be
      end

      it 'should have a usemap' do
        @image.include?('usemap="111"').should be
      end
    end
  end
end
