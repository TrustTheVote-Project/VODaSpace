require 'nokogiri'
require 'timeliness'

class Demog

  def self.parse(file, &block)
    Nokogiri::XML::SAX::Parser.new(Demog::Parser.new(&block)).parse_file(file)
  end

end

require_relative 'demog/parser'
require_relative 'demog/validation_error'
