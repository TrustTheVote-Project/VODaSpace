require 'demog/record'

class Demog::Parser

  def initialize(&block)
    @callback = block
    @record = Demog::Record.new
  end

  def xmldecl(version, encoding, standalone)
  end

  def start_document
  end

  def start_element_namespace(name, attrs = [], prefix = nil, uri = nil, ns = [])
    if name == 'voterDemographicRecord'
      @record.clear
      @attr_name = nil
    else
      @attr_name = Demog::Record::ATTRS[name]
    end
  end

  def start_element(name, attrs)
  end

  def end_element(name)
  end

  def end_element_namespace(name, prefix = nil, uri = nil)
    @attr_name = nil
    if name == 'voterDemographicRecord'
      @callback.call(@record)
    end
  end

  def characters(text)
    @record[@attr_name] = text.strip unless @attr_name.nil?
  end

  def end_document
  end

end
