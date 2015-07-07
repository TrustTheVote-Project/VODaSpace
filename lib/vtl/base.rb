class VTL::Base

  protected

  def value_or_nil(node, key)
    v = node.at_css(key)
    v && v.content
  end

end
