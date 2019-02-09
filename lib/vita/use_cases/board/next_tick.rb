module Vita
  module UseCases
    module Board
      class NextTick
        def initialize(board:)
          @board = board
        end

        def call
          @updated_state = []
          @board.state.each do |cell|
            alive_neighbors = 1
            @updated_state << Vita::UseCases::Cell::ApplyRules.new.call(cell: cell, alive_neighbors: alive_neighbors)
          end
          @board.state = @updated_state
          return @board
        end
      end
    end
  end
end