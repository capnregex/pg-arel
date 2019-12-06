# frozen_string_literal: true

module PG
  module Arel # :nodoc: all
    module Nodes
      class ArrayAgg < ::Arel::Nodes::Function
        include PG::Arel::ArrayPredications
      end
    end
  end
end
