class VTL::VoterTransactionLog < VTL::Base

  HASH_ALG_NONE = "none"
  HASH_ALG_SHA1 = "sha1"

# <xs:element name="origin"     type="xs:string" />
# <xs:element name="originUniq" type="xs:string" minOccurs="0" />
# <xs:element name="hashAlg"    type="hashAlgType" />
# <xs:element name="createDate" type="xs:dateTime" />

  # header
  attr_reader :origin
  attr_reader :origin_uniq
  attr_reader :hash_alg
  attr_reader :create_date

  # records
  attr_reader :records

  def initialize(node)
    @origin      = required(node, 'origin')
    @origin_uniq = optional(node, 'originUniq')
    @hash_alg    = required(node, 'hashAlg')
    @create_date = Timeliness.parse(required(node, 'createDate'), zone: :utc)

    @records = node.css('voterTransactionRecord').map { |node| VTL::VoterTransactionRecord.new(node) }
  end

end
