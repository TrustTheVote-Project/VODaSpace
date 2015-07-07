require 'test_helper'

class VTLTest < Minitest::Test

  def test_parse
    log = VTL.parse(open(File.dirname(__FILE__) + "/fixtures/log-full.xml"))
    refute_nil log
  end

end
