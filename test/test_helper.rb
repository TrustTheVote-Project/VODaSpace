require 'minitest/autorun'
require 'nokogiri'
require 'vtl'

def node_from_fixture(name)
  path = File.dirname(__FILE__) + "/fixtures/#{name}"
  doc = Nokogiri.XML(open(path))
  doc.root
end

