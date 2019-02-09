module Vita
  module UseCases
    module Game
      class Start
        def initialize(presenter:)
          @board = Vita::Entities::Board.new
          @presenter = presenter
        end

        def call
          loop do
            @board = Vita::UseCases::Board::NextTick.new(board: @board).call
            @presenter.call(board: @board.state)
            sleep 0.5 and system 'clear'
          end
        end
      end
    end
  end
end