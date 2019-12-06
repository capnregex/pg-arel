module PG
  module Arel # :nodoc: all
    module Nodes
      class Concat < ::Arel::Nodes::InfixOperation
        include PG::Arel::ArrayPredications
        def initialize left, right
          super('||', left, right)
        end
      end
    end
  end
end
