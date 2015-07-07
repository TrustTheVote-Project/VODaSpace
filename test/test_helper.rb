require 'minitest/autorun'
require 'nokogiri'
require 'vtl'

def node_from_fixture(name)
  path = File.dirname(__FILE__) + "/fixtures/#{name}"
  doc = Nokogiri.XML(open(path))
  doc.root
end

def assert_required(key, fixture)
  err = assert_raises(VTL::ValidationError) do
    parse fixture
  end

  assert_equal "#{key} is missing", err.message
end

def assert_invalid(key, fixture)
  err = assert_raises(VTL::ValidationError) do
    parse fixture
  end

  assert_match /^#{key} value .* is not among/, err.message
end
