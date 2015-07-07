require 'test_helper'

class VTL::VoterTransactionLogTest < Minitest::Test

  def test_full
    log = parse "log-full.xml"

    assert_equal "Sample Virginia Data", log.origin
    assert_equal "B6BF0C25-BDEA-440B-BDAF-F484D01FA90D", log.origin_uniq
    assert_equal "SHA1", log.hash_alg
    assert_equal "2014-07-21 08:54:03", log.create_date.utc.strftime("%Y-%m-%d %H:%M:%S")

    assert_equal 2, log.records.size
    assert_equal "ACLyxNKFJvmidhT0E7KttaM07lk=", log.records[0].voter_id
    assert_equal "AL/K6aDqL+wD3akQv6QmnYP7TYg=", log.records[1].voter_id
  end

  def test_required
    log = parse "log-required.xml"

    assert_equal "Sample Virginia Data", log.origin
    assert_nil   log.origin_uniq
    assert_equal "SHA1", log.hash_alg
    assert_equal "2014-07-21 08:54:03", log.create_date.utc.strftime("%Y-%m-%d %H:%M:%S")
    assert_equal 0, log.records.size
  end

  def test_missing_origin
    assert_required "origin", "log-missing-origin.xml"
  end

  def test_missing_hash_alg
    assert_required "hashAlg", "log-missing-hash-alg.xml"
  end

  def test_missing_create_date
    assert_required "createDate", "log-missing-create-date.xml"
  end

  private

  def parse(name)
    node = node_from_fixture(name)
    VTL::VoterTransactionLog.new(node)
  end

end
