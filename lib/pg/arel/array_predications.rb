# frozen_string_literal: true

module PG
  module Arel # :nodoc: all
    module ArrayPredications
      def contains(other)
        PG::Arel::Nodes::Contains.new(self, other)
      end
      def is_contained_by(other)
        PG::Arel::Nodes::IsContainedBy.new(self, other)
      end
      def overlap(other)
        PG::Arel::Nodes::Overlap.new(self, other)
      end
      def concat(other)
        PG::Arel::Nodes::Concat.new(self, other)
      end
    end
  end
end
