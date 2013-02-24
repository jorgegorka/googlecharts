module Gchart
  class QueryBuilder
    attr_accessor :size, :width, :height

    def self.build(values)
      formatted_values = format_values(values)
      formatted_values.map do |key, value|
        "#{key}=#{value}"
      end
    end

    private

    def self.format_values(values)
      values.each do |key, value|
        values[key] = convert_to_string(value)
      end
    end

    def self.convert_to_string(str_info)
      if str_info.is_a?(Array)
        str_info.map{|label| "#{CGI::escape(label.to_s)}"}.join('|')
      else
        str_info
      end
    end
  end
end
