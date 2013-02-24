module Gchart
  class Chart
    attr_reader :horizontal, :overlapped, :grouped, :legend, :labels
    attr_accessor :size, :width, :height

    def initialize(options = {})
      # Start with theme defaults if a theme is set
      theme = options[:theme]
      options = theme ? Theme.load(theme).to_options.merge(options) : options
      # # Extract the format and optional filename, then clean the hash
      @format = options[:format] || 'url'
      options[:filename] ||= default_filename
      options.delete(:format)

      @legend = options.delete(:legend)
      self.size = options.delete(:size) if options[:size]
      @width = options.delete(:width) if options[:width]
      @height = options.delete(:height) if options[:height]
      set_orientation(options.delete(:orientation))
      set_overlapped(options.delete(:overlapped))
      set_grouped(options.delete(:grouped))

      #update map_colors to become bar_colors
      options.update(:bar_colors => options[:map_colors]) if options.has_key?(:map_colors)

      # JORGE sending self to Gchart just a temp fix
      @chart = Gchart.new(options.merge!({:type => self.class.to_s.downcase.gsub('gchart::', '')}), self)
    end

    def draw
      @chart.send(@format)
    end

    def size
      "#{width}x#{height}"
    end

    def width
      @width ||= 300
    end

    def height
      @height ||= 200
    end

    # Defines the Graph size using the following format:
    # width X height
    def size=(size='300x200')
      self.width, self.height = size.split("x").map { |dimension| dimension.to_i }
    end

    def set_size
      "chs=#{size}"
    end

    # A chart can have one or many legends.
    # Gchart::Line.new(:legend => 'label')
    # or
    # Gchart::Line.new(:legend => ['first label', 'last label'])
    def set_legend
      if legend.is_a?(Array)
        "chdl=#{@legend.map{|label| "#{CGI::escape(label.to_s)}"}.join('|')}"
      else
        "chdl=#{legend}"
      end
    end

    def set_labels
    end

    private

    def default_filename
      'chart.png'
    end

    def set_orientation(orientation)
      @horizontal = %w(h horizontal).include?(orientation) ? true : false
    end

    def set_overlapped(overlapped=false)
      @overlapped = overlapped
    end

    def set_grouped(grouped=false)
      @grouped = grouped
    end
  end
end
