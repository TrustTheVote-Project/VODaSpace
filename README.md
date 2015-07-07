# vtl

Parser for the VTL XML format conforming to XSD 4.4.

## Usage

    vtl = VTL.parse(xml_string)

Returns the `VTL::VoterTransactionLog` object that you can use to access data.

    origin
    origin_uniq
    hash_alg
    create_date
    records           # => [ VTL::VoterTransactionRecord, ... ]

Each record has validated set of fields:

    voter_id
    date
    action
    form
    form_note
    jurisdiction
    leo
    notes
    comment
    election

