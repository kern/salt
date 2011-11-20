module Salt
  class BasicTransformation < Transformation
    attr_reader :selector

    def initialize(selector, &transform)
      @selector = selector
      @transform = transform
    end

    def transform(node)
      @transform[node]
    end
  end
end
