require 'nokogiri'
require 'timeliness'

class VTL

  def self.parse(xml)
    doc = Nokogiri.XML(xml)
    log = VTL::VoterTransactionLog.new
    log.load_from_node(doc.root)
    log
  end

end

require_relative 'vtl/base'
require_relative 'vtl/validation_error'
require_relative 'vtl/voter_transaction_record'
require_relative 'vtl/voter_transaction_log'
