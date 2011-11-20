module Salt
  class Transformation
    def selector
      raise RuntimeError.new("you must override #selector for transformations")
    end

    def transform(node)
      raise RuntimeError.new("you must override #transform for transformations")
    end

    def apply(doc)
      doc.search(selector).each { |n| transform(n) }
      doc
    end
  end
end
