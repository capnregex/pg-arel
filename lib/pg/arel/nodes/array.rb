# frozen_string_literal: true

module PG
  module Arel # :nodoc: all
    module Nodes
      class Array < ::Arel::Nodes::Node
        include ::Arel::Predications
        include ::Arel::WindowPredications
        include ::Arel::OrderPredications
        include PG::Arel::ArrayPredications
        attr_accessor :elements

        def initialize expr
          super()
          @elements = expr
        end

        def hash
          [@elements].hash
        end

        def eql? other
          self.class == other.class &&
            self.elements == other.elements
        end
        alias :== :eql?
      end
    end
  end
end
