module Vita
  module Entities
    class Cell
      STATUSES = %w(ALIVE DEAD)

      attr_accessor :state

      def initialize
        @state = STATUSES.sample
      end
    end
  end
end