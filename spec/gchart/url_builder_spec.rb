require 'spec_helper'

describe Gchart::UrlBuilder do
  subject { described_class.new }
  describe :methods do
    describe :initialize do
      it 'should assing use_ssl to false by default' do
        subject.use_ssl.should be_false
      end
      it 'should assing use_ssl to false by default' do
        described_class.new(true).use_ssl.should be
      end
    end
    describe :url do
      it 'should return default google api url' do
        subject.url.should == 'http://chart.apis.google.com/chart?'
      end
      it 'returns ssl if requested' do
        described_class.new(true).url.should == 'https://chart.googleapis.com/chart?'
      end
    end
  end
end
