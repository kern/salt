require "nokogiri"

module Salt
  class Transformer
    attr_reader :document

    class << self
      def transformations
        @transformations ||= []
      end

      def add_transformation(transformation)
        transformations.push(transformation)
      end

      def transform(*args, &block)
        transformation = Salt::BasicTransformation.new(*args, &block)
        add_transformation(transformation)
      end

      def inherited(klass)
        @transformations = klass.transformations
      end

      def from_html(doc)
        new(Nokogiri::HTML(doc))
      end

      def from_xml(doc)
        new(Nokogiri::XML(doc))
      end
    end

    def initialize(document)
      @document = document
    end

    def transformations
      self.class.transformations
    end

    def apply
      transformations.each { |t| t.apply(@document) }
      @document.to_s
    end
  end
end
