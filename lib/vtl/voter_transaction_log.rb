class VTL::VoterTransactionLog < VTL::Base

  HASH_ALG_VALUES = %w( none sha1 )

  # header
  attr_reader :origin
  attr_reader :origin_uniq
  attr_reader :hash_alg
  attr_reader :create_date

  # records
  attr_reader :records

  def load_from_node(node)
    @origin      = required(node, 'origin')
    @origin_uniq = optional(node, 'originUniq')
    @hash_alg    = among('hashAlg', required(node, 'hashAlg'), HASH_ALG_VALUES)
    @create_date = Timeliness.parse(required(node, 'createDate'), zone: :utc)

    @records = node.css('voterTransactionRecord').map do |node|
      rec = VTL::VoterTransactionRecord.new
      rec.load_from_node(node)
      rec
    end
  end

end
