module Gchart
  class UrlBuilder

    attr_reader :use_ssl

    def initialize(use_ssl=false)
      @use_ssl = use_ssl
    end

    def url
      if use_ssl
        'https://chart.googleapis.com/chart?'
      else
        'http://chart.apis.google.com/chart?'
      end
    end

    private
  end
end
