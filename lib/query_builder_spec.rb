require 'rails_helper'

RSpec.describe QueryBuilder do
  let(:foo) { Arel.sql('FOO') }
  let(:agg) { PG::Arel.array_agg(foo) }
  let(:ast) { QueryBuilder.array([1,2,3]) }
  let(:alt) { PG::Arel.array([2,3,4]) }

  describe ".array" do
    subject { ast.to_sql }
    it { expect(ast.to_sql).to eq('ARRAY[1, 2, 3]') }
    it { expect(alt.to_sql).to eq('ARRAY[2, 3, 4]') }
    it { expect(ast.contains(alt).to_sql).to eq('ARRAY[1, 2, 3] @> ARRAY[2, 3, 4]') }
    it { expect(agg.contains(alt).to_sql).to eq('ARRAY_AGG(FOO) @> ARRAY[2, 3, 4]') }
    it { expect(ast.is_contained_by(alt).to_sql).to eq('ARRAY[1, 2, 3] <@ ARRAY[2, 3, 4]') }
    it { expect(ast.overlap(alt).to_sql).to eq('ARRAY[1, 2, 3] && ARRAY[2, 3, 4]') }
    it { expect(ast.concat(alt).to_sql).to eq('ARRAY[1, 2, 3] || ARRAY[2, 3, 4]') }
    it { expect(ast.concat(alt).contains(alt).to_sql).to eq('ARRAY[1, 2, 3] || ARRAY[2, 3, 4] @> ARRAY[2, 3, 4]') }
  end
end
