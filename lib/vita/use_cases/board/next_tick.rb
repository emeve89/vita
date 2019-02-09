module Vita
  module UseCases
    module Board
      class NextTick
        def initialize(board:)
          @board = board
          @updated_state = []
        end

        def call
          @board.state.each_with_index do |cell, index|
            alive_neighbors = @board.neighbors_alive(index).count
            @updated_state << Vita::UseCases::Cell::ApplyRules.new.call(cell: cell, alive_neighbors: alive_neighbors)
          end
          @board.tap { |board| board.state = @updated_state }
        end
      end
    end
  end
end