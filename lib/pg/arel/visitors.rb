# frozen_string_literal: true

module PG
  module Arel # :nodoc: all
    module Visitors
      private
        def visit_PG_Arel_Nodes_Array(o, collector)
          collector << "ARRAY["
          collector = inject_join(o.elements, collector, ", ") << "]"
          collector
        end

        def visit_PG_Arel_Nodes_ArrayAgg(o, collector)
          collector << "ARRAY_AGG("
          collector << "DISTINCT " if o.distinct
          collector = inject_join(o.expressions, collector, ", ") << ")"
          if o.alias
            collector << " AS "
            visit o.alias, collector
          else
            collector
          end
        end
    end
  end
end
