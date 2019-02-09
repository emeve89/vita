module Vita
  module Entities
    class Cell
      STATUSES = %w(ALIVE DEAD).freeze

      attr_reader :state

      def initialize
        @state = STATUSES.sample
      end

      def set_state(state)
        raise ArgumentError.new('state is invalid') unless STATUSES.include?(state)
        @state = state
        self
      end
    end
  end
end