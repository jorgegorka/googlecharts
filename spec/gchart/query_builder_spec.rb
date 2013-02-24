require 'spec_helper'

describe Gchart::QueryBuilder do
  describe :methods do
    describe :build do
      it 'return params' do
        values = {:chls => 9}
        described_class.build(values).should == ['chls=9']
      end

      it 'convert arrays into strings' do
        values = {:chls => 9, :chl => ['Label A', 'Label B']}
        described_class.build(values).should == ['chls=9', 'chl=Label+A|Label+B']
      end
    end
  end
end
