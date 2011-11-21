module Salt
  module Support
    class PointlessTransformer < Salt::Transformer
      transform("foo") { |n| n.name = "bar" }
    end
  end
end
