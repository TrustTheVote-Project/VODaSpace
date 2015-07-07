class VTL::Base

  protected

  def optional(node, key)
    v = node.at_css(key)
    v && v.content
  end

  def required(node, key)
    v = node.at_css(key)
    v = v && v.content
    raise VTL::ValidationError.new("#{key} is missing") if v.nil? or v.empty?
    v
  end

  def among(key, value, values)
    return value if value.nil? or value.empty?
    raise VTL::ValidationError.new("#{key} value '#{value}' is not among #{values.inspect}") unless values.include?(value.downcase)
    value
  end

end
