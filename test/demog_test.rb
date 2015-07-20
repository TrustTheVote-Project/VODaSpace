require 'test_helper'

class DemogTest < Minitest::Test

  class Handler
    attr_reader :header
    attr_reader :recs

    def initialize
      @recs = []
    end

    def parsed_header(header)
      @header = header
    end

    def parsed_record(rec)
      @recs << rec.clone
    end
  end

  def test_parse_file
    handler = Handler.new
    Demog.parse_file(File.dirname(__FILE__) + "/fixtures/demog-short.xml", handler)
    assert_handler(handler)
  end

  def test_parse_url
    handler = Handler.new
    Demog.parse_uri('https://raw.githubusercontent.com/TrustTheVote-Project/demog/master/test/fixtures/demog-short.xml', handler)
    assert_handler(handler)
  end

  def assert_handler(handler)
    # header
    h = handler.header
    assert_equal "demog-short.xml", h.filename
    assert_equal "Sample Virginia Data", h.origin
    assert_equal "7468b548-9984-4696-9f62-c95e237d964f", h.origin_uniq
    assert_equal "2015-07-15T16:05:20", h.create_date
    assert_equal "SHA1", h.hash_alg

    # records
    assert_equal 2, handler.recs.size

    r = handler.recs[0]
    assert_equal "001000000", r.voter_id
    assert_equal "ACCOMACK COUNTY", r.jurisdiction
    assert_equal "1957-12-16", r.reg_date
    assert_equal "1939", r.year_of_birth
    assert_equal "Active", r.reg_status
    assert_equal "Female", r.gender
    assert_equal "White", r.race
    assert_equal "Democratic", r.political_party_name
    assert_equal false, r.overseas
    assert_equal false, r.military
    assert_equal true, r.protected
    assert_equal false, r.disabled
    assert_equal false, r.absentee_ongoing
    assert_equal false, r.absentee_in_this_election
    assert_equal nil, r.precinct_split_id
    assert_equal "0000", r.zip_code

    r = handler.recs[1]
    assert_equal "001000001", r.voter_id
    assert_equal "ACCOMACK COUNTY", r.jurisdiction
    assert_equal "1947-04-07", r.reg_date
    assert_equal "1929", r.year_of_birth
    assert_equal "Active", r.reg_status
    assert_equal "Male", r.gender
    assert_equal "White", r.race
    assert_equal "Democratic", r.political_party_name
    assert_equal false, r.overseas
    assert_equal false, r.military
    assert_equal false, r.protected
    assert_equal true, r.disabled
    assert_equal false, r.absentee_ongoing
    assert_equal false, r.absentee_in_this_election
    assert_equal nil, r.precinct_split_id
    assert_equal "0000", r.zip_code
  end

end
