require "acceptance_helper"

class SemanticTransformer < Salt::Transformer
  transform("b") { |n| n.name = "strong" }
  transform("i") { |n| n.name = "em" }
end

class PointlessTransformer < Salt::Transformer
  transform("foo") { |n| n.name = "bar" }
end

feature "transform a document", %q{
In order to make my HTML and XML more maintainable
As a web developer
I want to apply transformations to my HTML and XML
}, do
  include Salt::Spec::Fixtures

  let(:simple_html) { load_fixture("simple.html") }
  let(:simple_xml) { load_fixture("simple.xml") }

  scenario "transform a simple HTML document" do
    transformer = SemanticTransformer.from_html(simple_html)
    transformer.should transform_into("semantic_simple.html")
  end

  scenario "transform a simple XML document" do
    transformer = PointlessTransformer.from_xml(simple_xml)
    transformer.should transform_into("pointless_simple.xml")
  end
end
