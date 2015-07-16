require 'hashie'

class Demog::Record < Hashie::Mash

  include Hashie::Extensions::Coercion

  ATTRS = {
    'voterid'                => 'voter_id',
    'jurisdiction'           => 'jurisdiction',
    'regDate'                => 'reg_date',
    'yearOfBirth'            => 'year_of_birth',
    'regStatus'              => 'reg_status',
    'gender'                 => 'gender',
    'race'                   => 'race',
    'politicalPartyName'     => 'political_party_name',
    'overseas'               => 'overseas',
    'military'               => 'military',
    'protected'              => 'protected',
    'disabled'               => 'disabled',
    'absenteeOngoing'        => 'absentee_ongoing',
    'absenteeInThisElection' => 'absentee_in_this_election',
    'precinctSplitID'        => 'precinct_split_id',
    'zip'                    => 'zip_code' }

  coerce_key :overseas, ->(v) { boolean_coercion(v) }
  coerce_key :military, ->(v) { boolean_coercion(v) }
  coerce_key :protected, ->(v) { boolean_coercion(v) }
  coerce_key :disabled, ->(v) { boolean_coercion(v) }
  coerce_key :absentee_ongoing, ->(v) { boolean_coercion(v) }
  coerce_key :absentee_in_this_election, ->(v) { boolean_coercion(v) }

  def self.boolean_coercion(v)
    case v
    when String
      return !!(v =~ /^(true|t|yes|y|1)$/i)
    when Numeric
      return !v.to_i.zero?
    else
      return v == true
    end
  end

end
