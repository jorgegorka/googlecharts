require 'gchart/version'
require 'gchart/gchart'
require 'gchart/theme'
require "net/http"
require "net/https"
require "uri"
require "cgi"
require 'enumerator'

Googlecharts = Gchart unless Object.const_defined? 'Googlechart'
