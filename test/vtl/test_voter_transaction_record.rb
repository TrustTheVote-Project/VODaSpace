require 'test_helper'

class VTL::VoterTransactionRecordTest < Minitest::Test

  def test_full
    rec = parse "record-full.xml"

    assert_equal "ACLyxNKFJvmidhT0E7KttaM07lk=", rec.voter_id
    assert_equal "2014-07-11 15:46:38", rec.date.utc.strftime("%Y-%m-%d %H:%M:%S")
    assert_equal "approve", rec.action
    assert_equal "VoterRecordUpdate", rec.form
    assert_equal "PRINCE GEORGE COUNTY", rec.jurisdiction
    assert_equal "NVRAmotorVehicles", rec.form_note
    assert_equal "Leo", rec.leo
    assert_equal "rejectLate", rec.notes
    assert_equal "Comment", rec.comment
    assert_equal "Election", rec.election
  end

  def test_required
    rec = parse "record-required.xml"

    assert_equal "ACLyxNKFJvmidhT0E7KttaM07lk=", rec.voter_id
    assert_equal "2014-07-11 15:46:38", rec.date.utc.strftime("%Y-%m-%d %H:%M:%S")
    assert_equal "approve", rec.action
    assert_equal "PRINCE GEORGE COUNTY", rec.jurisdiction
    assert_nil   rec.form
    assert_nil   rec.form_note
    assert_nil   rec.leo
    assert_nil   rec.notes
    assert_nil   rec.comment
    assert_nil   rec.election
  end

  def test_missing_voter_id
    assert_required 'voterid', "record-missing-voterid.xml"
  end

  def test_missing_jurisdiction
    assert_required 'jurisdiction', "record-missing-jurisdiction.xml"
  end

  def test_missing_date
    assert_required 'date', "record-missing-date.xml"
  end

  def test_missing_action
    assert_required 'action', "record-missing-action.xml"
  end

  def test_invalid_action
    assert_invalid 'action', "record-invalid-action.xml"
  end

  def test_invalid_form
    assert_invalid 'form', "record-invalid-form.xml"
  end

  def test_invalid_form_note
    assert_invalid 'formNote', "record-invalid-form-note.xml"
  end

  def test_invalid_notes
    assert_invalid 'notes', "record-invalid-notes.xml"
  end

  private

  def parse(name)
    node = node_from_fixture(name)
    VTL::VoterTransactionRecord.new(node)
  end

end
