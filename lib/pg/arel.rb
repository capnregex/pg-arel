# frozen_string_literal: true

require "pg/arel/version"

module Pg
  module Arel
    class Error < StandardError; end
    # Your code goes here...
    extend ArrayOperators
  end
end
