require "spec_helper"

describe Salt::BasicTransformation do
  let(:transform) { lambda { |n| "#{n}bar" } }
  let(:transformation) { Salt::BasicTransformation.new("tabs", &transform) }
  subject { transformation }

  describe "#initialize" do
    it "sets the selector" do
      subject.selector.should == "tabs"
    end

    it "sets the transform" do
      subject.transform("foo").should == "foobar"
    end
  end
end
