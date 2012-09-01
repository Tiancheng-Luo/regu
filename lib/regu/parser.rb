require 'treetop'

module Regu
  class Parser
    Treetop.load 'lib/regu/regu_expression'
    
    def self.parse(text)
      parser = ReguExpressionParser.new
      root = parser.parse(text)
      if root
        root.value
      else
        raise 'Parse Error! %s' % parser.failure_reason
      end
    end
  end
  
  def self.[](text)
    parse_tree = Regu::Parser.parse(text)
    # pp parse_tree
    parse_tree.compile
  end
end
