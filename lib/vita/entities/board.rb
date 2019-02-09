module Vita
  module Entities
    class Board
      attr_accessor :state

      def initialize(rows = 6)
        @rows = rows
        @cells_number = @rows ** 2
        @state = Array.new(@cells_number) { Vita::Entities::Cell.new }
      end

      def neighbors_alive(index)
        neighbors(index).select do |cell|
          cell.state == 'ALIVE'
        end
      end

      private

      def neighbors(index)
        [
            east(index),
            west(index),
            north(index),
            south(index),
            northwest(index),
            northeast(index),
            southwest(index),
            southeast(index)
        ].compact
      end

      def east(index)
        excluded_indexes = (1..@cells_number).select {|i| (i % @rows).zero? }.map {|i| i - 1}
        at_index = index + 1
        return nil if (at_index > @rows ** 2 - 1 || excluded_indexes.include?(index))
        @state[at_index]
      end

      def west(index)
        excluded_indexes = (1...@cells_number).select {|i| (i % @rows).zero?}
        at_index = index - 1
        return nil if at_index < 0 || excluded_indexes.include?(index)
        @state[at_index]
      end

      def north(index)
        return nil if (0...4).include?(index)
        at_index = index - @rows
        @state[at_index]
      end

      def south(index)
        return nil if (@cells_number - 5...@cells_number).include?(index)
        at_index = index + @rows
        @state[at_index]
      end

      def northwest(index)
        excluded_indexes = (1...@cells_number).select {|i| (i % @rows).zero?}
        at_index = index - @rows - 1
        return nil if at_index < 0 || excluded_indexes.include?(index) || (0...4).include?(index)
        @state[at_index]
      end

      def northeast(index)
        excluded_indexes = (1..@cells_number).select {|i| (i % @rows).zero? }.map {|i| i - 1}
        at_index = index - @rows + 1
        return nil if at_index < 0 || (0...4).include?(index) || excluded_indexes.include?(index)
        @state[at_index]
      end

      def southwest(index)
        excluded_indexes = (1..@cells_number).select {|i| (i % @rows).zero? }
        at_index = index + @rows - 1
        return nil if at_index > @rows ** 2 - 1 || (@cells_number - 5...@cells_number).include?(index) || excluded_indexes.include?(index)
        @state[at_index]
      end

      def southeast(index)
        excluded_indexes = (1..@cells_number).select {|i| (i % @rows).zero? }.map {|i| i - 1}
        at_index = index + @rows + 1
        return nil if at_index > @rows ** 2 - 1 || (@cells_number - 5...@cells_number).include?(index) || excluded_indexes.include?(index)
        @state[at_index]
      end

    end
  end
end