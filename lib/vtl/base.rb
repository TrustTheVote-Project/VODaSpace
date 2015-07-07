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

end
