module Gchart
  class Chart
    attr_reader :horizontal, :overlapped, :grouped, :legend, :thickness
    attr_accessor :size, :width, :height, :labels
    attr_reader :params

    def initialize(options = {})
      # Start with theme defaults if a theme is set
      theme = options[:theme]
      options = theme ? Theme.load(theme).to_options.merge(options) : options
      # # Extract the format and optional filename, then clean the hash
      @format = options[:format] || 'url'
      options[:filename] ||= default_filename
      options.delete(:format)

      @width             = options.delete(:width) if options[:width]
      @height            = options.delete(:height) if options[:height]
      self.size          = options.delete(:size) if options[:size]
      params[:chdl]      = options.delete(:legend)
      params[:chs]       = self.size
      params[:chl]       = options.delete(:labels) if options[:labels]
      params[:chls]      = options.delete(:thickness) if options[:thickness]
      params[:chm]       = options.delete(:new_markers) if options[:new_markers]
      params[:chg]       = options.delete(:grid_lines) if options[:grid_lines]
      params[:chtm]       = options.delete(:geographical_area) if options[:geographical_area]
      set_orientation(options.delete(:orientation))
      set_overlapped(options.delete(:overlapped))
      set_grouped(options.delete(:grouped))
      params[:cht]       = type

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

    def params
      @params ||={}
    end

    # Defines the Graph size using the following format:
    # width X height
    def size=(size='300x200')
      self.width, self.height = size.split("x").map { |dimension| dimension.to_i }
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
