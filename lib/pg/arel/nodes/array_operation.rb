module PG
  module Arel # :nodoc: all
    module Nodes
      class Contains < ::Arel::Nodes::InfixOperation
        def initialize left, right
          super('@>', left, right)
        end
      end
    end
  end
end
