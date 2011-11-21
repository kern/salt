require "acceptance_helper"

feature "transform a document", %q{
As a web developer
I want to apply transformations to my HTML and XML
So that my HTML and XML are more maintainable
}, do
  include Salt::Support::Fixtures

  let(:simple_html) { load_fixture("simple.html") }
  let(:simple_xml) { load_fixture("simple.xml") }

  scenario "transform a simple HTML document" do
    transformer = Salt::Support::SemanticTransformer.from_html(simple_html)
    transformer.should transform_into("semantic_simple.html")
  end

  scenario "transform a simple XML document" do
    transformer = Salt::Support::PointlessTransformer.from_xml(simple_xml)
    transformer.should transform_into("pointless_simple.xml")
  end
end
