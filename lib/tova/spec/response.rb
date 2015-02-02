require 'pathname'
module Tova
  module Spec
    module Response
      def response(response_path)
        Fixture.new(response_path).read
      end

      class Fixture
        Error = Class.new(StandardError)
        ResponseNotFound = Class.new(Error)

        def self.response_paths
          @response_paths ||= begin
            [(Pathname.new(__FILE__).parent + 'responses/')]
          end
        end

        def initialize(response_path)
          self.response_path = response_path

        end

        def read
          raise ResponseNotReadable unless path.readable?
          path.read
        end

        def path
          @path ||= Pathname.new(response_mapping[response_path])
        end

        private
        attr_accessor :response_path

        def self.response_mapping
          @response_mapping ||= Hash.new do |hash, key|
            response_path = response_paths.find do |response_path|
              response_path.join(key).file?
            end

            if response_path
              hash[key] = response_path.join(key)
            else
              raise ResponseNotFound, %Q|'#{key}' not found in #{response_paths}|
            end
          end
        end

        def responses
          self.class.responses
        end

        def response_file
          @response_file ||= response_mapping[response_path]
        end

        def response_mapping
          self.class.response_mapping
        end

        def response_paths
          self.class.response_paths
        end
      end
    end
  end
end

if defined?(RSpec)
  RSpec.configure do |c|
    c.include Tova::Spec::Response, tovanate: true
  end
end
