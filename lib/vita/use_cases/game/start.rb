module Vita
  module UseCases
    module Game
      class Start
        def initialize
          @board = Vita::Entities::Board.new
        end

        def call
          loop do
            Vita::UseCases::Board::NextTick.new(board: @board).call
          end
        end
      end
    end
  end
end