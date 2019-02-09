require 'spec_helper'

RSpec.describe Vita::UseCases::Board::NextTick do
  describe '#call' do
    let(:board) { double('board') }

    it 'receives a board as argument' do
      expect{described_class.new.call}.to raise_error
      expect{described_class.new.call(board: board)}.to_not raise_error
    end

    it 'updates the state of the board' do
      updated_state = double("updated_state")
      expect(board).to receive(:state=).with(updated_state)
      described_class.new.call(board: board)
    end

    it 'returns a Vita::Entities::Board' do
      result = described_class.new.call(board: board)
      expect(result.class).to Vita::Entities::Board
    end

    context 'for each cell in the board' do
      it 'calls Vita::UseCases::Cell::ApplyRules' do
        allow(board).to receive(:each).and_return([double('cell', state: 'ALIVE')])
        expect(Vita::UseCases::Cell::ApplyRules).to receive(:call).with(cell, alive_neighbors: 1)

        described_class.new.call(board: board)
      end
    end
  end
end