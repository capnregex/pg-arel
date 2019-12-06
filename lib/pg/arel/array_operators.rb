# frozen_string_literal: true

module PG
  module Arel # :nodoc: all
    module ArrayOperators
      def contains(left, right)
        PG::Arel::Nodes::Contains.new(left, right)
      end
      def is_contained_by(left, right)
        PG::Arel::Nodes::IsContainedBy.new(left, right)
      end
      def overlap(left, right)
        PG::Arel::Nodes::Overlap.new(left, right)
      end
      def concat(left, right)
        PG::Arel::Nodes::Concat.new(left, right)
      end
      def array_agg(expr)
        PG::Arel::Nodes::ArrayAgg.new([expr])
      end
      def array(expr)
        PG::Arel::Nodes::Array.new(expr)
      end
    end
  end
end
