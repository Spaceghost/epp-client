require 'tova/core/xml_parser'
require 'pathname'

module Tova
  module Core
    module Validators
      class EPP
        class SchemaValidationError < StandardError
          attr_accessor :errors

          def initialize(opts)
            self.errors = opts[:errors]
          end
        end

        attr_accessor :document

        def initialize(document)
          self.document = document
        end

        def validate!
          errors = schema.validate(document)
          raise SchemaValidationError.new(errors: errors), "You fucked up" unless errors.empty?
          document
        end

        private

        def schema
          @schema ||= load_schema
        end

        def load_schema
          path = Pathname.new(__FILE__).join('../../schemas').expand_path
          content = File.read(path.join('epp-1.0.xsd'))

          Dir.chdir(path) do
            Nokogiri::XML::Schema(content)
          end
        end
      end
    end
  end
end
