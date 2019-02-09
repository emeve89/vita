module Vita
  module Entities
    class Board
      attr_accessor :state

      def initialize
        rows = 10
        cols = 10
        @state = Array.new(rows) { Array.new(cols) { Vita::Entities::Cell.new } }
      end

    end
  end
end