require "spec_helper"

class StubTransformation < Salt::Transformation
  def selector
    "tabs"
  end

  def transform(node)
    node.content = "Woo!"
  end
end

describe Salt::Transformation do
  let(:doc) { double("document") }
  let(:empty_transformation) { Salt::Transformation.new }
  let(:stub_transformation) { StubTransformation.new }
  subject { stub_transformation }

  describe "#selector" do
    context "when the selector has not been defined" do
      subject { empty_transformation }

      it "doesn't work" do
        expect {
          subject.selector
        }.to raise_error(RuntimeError)
      end
    end
  end

  describe "#transform" do
    context "when the transform has not been defined" do
      subject { empty_transformation }

      it "doesn't work" do
        expect {
          subject.selector
        }.to raise_error(RuntimeError)
      end
    end
  end

  describe "#apply" do
    let(:node) { double("node") }

    before do
      doc.stub(:search).with("tabs") { [node] * 3 }
    end

    it "calls the transform on each matched node" do
      node.should_receive(:content=).with("Woo!").exactly(3).times
      subject.apply(doc)
    end
  end
end
