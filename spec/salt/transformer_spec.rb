require "spec_helper"

describe Salt::Transformer do
  include Salt::Spec::Fixtures

  let(:doc) { double("document") }
  let(:transformation) { double("transformation") }
  let(:transformer_klass) { Class.new(Salt::Transformer) }
  let(:transformer) { transformer_klass.new(doc) }
  subject { transformer }

  describe ".add_transformation" do
    subject { transformer_klass }

    it "adds a transformation" do
      subject.add_transformation(transformation)
      subject.transformations.should include(transformation)
    end
  end

  describe ".transform" do
    subject { transformer_klass }

    before do
      subject.transform("tabs") { "more beef" }
    end

    it "adds a new transformation" do
      subject.transformations.should have(1).transformation
    end

    it "is an instance of BasicTransformation" do
      transformation = subject.transformations.first
      transformation.should be_a(Salt::BasicTransformation)
    end
  end

  describe ".inherited" do
    let(:transformer_subklass) { Class.new(transformer_klass) }
    subject { transformer_subklass }

    before do
      transformer_klass.transform("tabs") {}
    end

    it "inherits the transformations from its superclass" do
      subject.transformations.should == transformer_klass.transformations
    end
  end

  describe ".from_html" do
    let(:html) { load_fixture("simple.html") }
    let(:transformer) { transformer_klass.from_html(html) }

    it "returns a Nokogiri document" do
      subject.document.should be_a(Nokogiri::HTML::Document)
    end
  end

  describe ".from_xml" do
    let(:xml) { load_fixture("simple.xml") }
    let(:transformer) { transformer_klass.from_xml(xml) }

    it "returns a Nokogiri document" do
      subject.document.should be_a(Nokogiri::XML::Document)
    end
  end

  describe "#initialize" do
    it "sets the document" do
      subject.document.should == doc
    end
  end

  describe "#transformations" do
    it "returns the transformations of its class" do
      subject.transformations.should == transformer_klass.transformations
    end
  end

  describe "#apply" do
    it "applies each transformation to the document" do
      transformer_klass.add_transformation(transformation)
      transformer_klass.add_transformation(transformation)
      transformation.should_receive(:apply).with(doc).twice

      subject.apply
    end

    it "returns the document" do
      doc.stub(:to_s) { "<badhtml/>" }
      subject.apply.should == "<badhtml/>"
    end
  end
end
