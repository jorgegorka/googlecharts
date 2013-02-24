module Gchart
  class Meter < Chart
    def type
      'gom'
    end

    def set_legend
      @labels = legend
      set_labels
    end
  end
end
