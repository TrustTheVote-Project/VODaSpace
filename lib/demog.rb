require 'nokogiri'
require 'timeliness'

class Demog

  def self.parse_file(file, handler)
    filename = file.is_a?(String) ? File.basename(file) : file.original_filename
    Nokogiri::XML::SAX::Parser.new(Demog::Parser.new(filename, handler)).parse_file(file)
  end

  def self.parse_uri(uri, handler)
    uri = uri.is_a?(String) ? URI(uri) : uri
    filename = File.basename(uri.path)

    demog_parser = Demog::Parser.new(filename, handler)
    parser = Nokogiri::XML::SAX::PushParser.new(demog_parser)

    Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new(uri, 'User-Agent' => 'curl/7.37.1')

      http.request request do |response|
        # restore the filename if present
        disp = response.to_hash["content-disposition"].to_s
        if m = disp.scan(/filename=\\\"(.*?)\\\"/) and m.flatten.size > 0
          demog_parser.filename = m.flatten.first
        end

        response.read_body do |chunk|
          parser << chunk
        end
      end
    end
  end

end

require_relative 'demog/parser'
require_relative 'demog/validation_error'
