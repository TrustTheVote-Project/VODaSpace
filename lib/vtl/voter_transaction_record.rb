class VTL::VoterTransactionRecord < VTL::Base

  ACTION_VALUES    = %w( identify voterPollCheckin cancelVoterRecord start discard complete submit receive approve reject sentToVoter returnedUndelivered ).map(&:downcase)
  FORM_VALUES      = %w( VoterRegistration VoterRegistrationAbsenteeRequest VoterRecordUpdate VoterRecordUpdateAbsenteeRequest AbsenteeRequest AbsenteeBallot ProvisionalBallot PollBookEntry VoterCard ).map(&:downcase)
  FORM_NOTE_VALUES = %w( handMarked onlineGeneratedPaper onlineGeneratedPaperless FPCA FWAB NVRAmotorVehicles NVRAother stateForm thirdParty trackingCodeNone trackingCodeMatch trackingCodeNoMatch ).map(&:downcase)
  NOTES_VALUES     = %w(
    acceptReactivate acceptDuplicate acceptTransferIn acceptNewRequest acceptChange
    rejectLate rejectUnsigned rejectIncomplete rejectFelonyConviction rejectIncapacitated rejectUnderage rejectCitizenship rejectPreviousVoteAbsentee rejectPreviousVote rejectAdministrative rejectIneligible
    cancelUnderage cancelDuplicate cancelCitizenship cancelOther cancelTransferOut cancelDeceased cancelFelonyConviction cancelIncapacitated
    postalReceived personalReceived electronicReceived faxReceived
    postalSent emailSent electronicSent faxSent
    onlineVoterReg onlineBalloting ).map(&:downcase)

  attr_reader :voter_id
  attr_reader :date
  attr_reader :action
  attr_reader :form
  attr_reader :form_note
  attr_reader :jurisdiction
  attr_reader :leo
  attr_reader :notes
  attr_reader :comment
  attr_reader :election

  def load_from_node(node)
    @voter_id     = required(node, 'voterid')
    @date         = Timeliness.parse(required(node, 'date'))
    @action       = among('action', required(node, 'action'), ACTION_VALUES)
    @jurisdiction = required(node, 'jurisdiction')
    @form         = among('form', optional(node, 'form'), FORM_VALUES)
    @form_note    = among('formNote', optional(node, 'formNote'), FORM_NOTE_VALUES)
    @leo          = optional(node, 'leo')
    @notes        = among('notes', optional(node, 'notes'), NOTES_VALUES)
    @comment      = optional(node, 'comment')
    @election     = optional(node, 'election')
  end
end

