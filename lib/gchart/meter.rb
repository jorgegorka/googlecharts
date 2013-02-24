module Gchart
  class Meter < Chart
    def initialize(options={})
      super
      params[:chl] ||= params[:chdl]
    end

    def type
      'gom'
    end
  end
end
