module QueryBuilder
  class << self
    def array_agg(*args)
      Arel::Nodes::NamedFunction.new("array_agg", args)
    end

    def array_contains left_hand, right_hand
      Arel::Nodes::InfixOperation.new("@>", left_hand, right_hand)
    end

    def array arg
      PG::Arel::Nodes::Array.new(arg)
    end
  end
end
