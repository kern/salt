module Salt
  module Support
    module Fixtures
      def load_fixture(filename)
        File.open(fixture_path(filename)) { |f| f.read }
      end

      def parse_fixture(filename, format = :html)
        contents = load_fixture(filename)

        case format
        when :html; Nokogiri::HTML(contents)
        when :xml; Nokogiri::XML(contents)
        else contents
        end
      end

      private

      def fixture_path(filename)
        File.expand_path(filename, "spec/fixtures")
      end
    end
  end
end
