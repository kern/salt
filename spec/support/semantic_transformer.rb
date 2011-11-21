module Salt
  module Support
    class SemanticTransformer < Salt::Transformer
      transform("b") { |n| n.name = "strong" }
      transform("i") { |n| n.name = "em" }
    end
  end
end
