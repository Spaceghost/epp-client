require 'nokogiri'

module Tova
  module Core
    class XMLParser
      def self.parse(xml)
        Nokogiri.parse(xml)
      end

      private_class_method :new
    end
  end
end
