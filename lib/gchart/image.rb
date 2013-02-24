module Gchart
  class Image
    def image_tag(options)
      image = "<img"
      image << " id=\"#{options[:id]}\"" if options[:id]
      image << " class=\"#{options[:klass]}\"" if options[:klass]
      image << " src=\"#{options[:url]}\""
      image << " width=\"#{options[:width]}\""
      image << " height=\"#{options[:height]}\""
      image << " alt=\"#{options[:alt]}\""
      image << " title=\"#{options[:title]}\"" if options[:title]
      image << " usemap=\"#{options[:usemap]}\"" if options[:usemap]
      image << " />"
    end
  end
end
