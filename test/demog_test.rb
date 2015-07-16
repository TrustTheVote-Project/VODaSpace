require 'test_helper'

class DemogTest < Minitest::Test

  def test_parse
    recs = []
    Demog.parse(File.dirname(__FILE__) + "/fixtures/demog-short.xml") do |rec|
      recs << rec.clone
    end

    assert_equal 2, recs.size

    r = recs[0]
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

    r = recs[1]
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
