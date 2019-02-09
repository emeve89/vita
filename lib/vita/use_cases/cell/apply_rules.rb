module Vita
  module UseCases
    module Cell
      class ApplyRules
        def call(cell:, alive_neighbors:)
          cell.tap do |c|
            c.state == 'DEAD' && alive_neighbors == 3 ? c.set_state('ALIVE') : (c.set_state('DEAD') unless [2,3].include?(alive_neighbors))
          end
        end
      end
    end
  end
end

