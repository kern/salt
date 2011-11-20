RSpec::Matchers.define :transform_into do |expected|
  match do |actual|
    actual.apply == load_fixture(expected)
  end

  failure_message_for_should do |actual|
    "expected that #{actual} would transform into #{expected}"
  end

  failure_message_for_should_not do |actual|
    "expected that #{actual} would not transform into #{expected}"
  end

  description do
    "transform into #{expected}"
  end
end
