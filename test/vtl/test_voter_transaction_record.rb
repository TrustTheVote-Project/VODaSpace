require 'test_helper'

class VTL::VoterTransactionRecordTest < Minitest::Test

  def test_full
    node = node_from_fixture("record-full.xml")
    rec  = VTL::VoterTransactionRecord.new(node)

    assert_equal "ACLyxNKFJvmidhT0E7KttaM07lk=", rec.voter_id
    assert_equal "2014-07-11 15:46:38", rec.date.utc.strftime("%Y-%m-%d %H:%M:%S")
    assert_equal "approve", rec.action
    assert_equal "VoterRecordUpdate", rec.form
    assert_equal "PRINCE GEORGE COUNTY", rec.jurisdiction
    assert_equal "acceptChange", rec.form_note
    assert_equal "Leo", rec.leo
    assert_equal "Notes", rec.notes
    assert_equal "Comment", rec.comment
    assert_equal "Election", rec.election
  end

  def test_required
    node = node_from_fixture("record-required.xml")
    rec  = VTL::VoterTransactionRecord.new(node)

    assert_equal "ACLyxNKFJvmidhT0E7KttaM07lk=", rec.voter_id
    assert_equal "2014-07-11 15:46:38", rec.date.utc.strftime("%Y-%m-%d %H:%M:%S")
    assert_equal "approve", rec.action
    assert_equal "VoterRecordUpdate", rec.form
    assert_equal "PRINCE GEORGE COUNTY", rec.jurisdiction
    assert_nil   rec.form_note
    assert_nil   rec.leo
    assert_nil   rec.notes
    assert_nil   rec.comment
    assert_nil   rec.election
  end

end
