require 'spec_helper'

RSpec.describe Vita::UseCases::Board::NextTick do
  describe '#call' do
    let(:board) { Vita::Entities::Board.new }

    it 'receives a board as argument' do
      expect{described_class.new.call}.to raise_error
      expect{described_class.new(board: board).call}.to_not raise_error
    end

    it 'updates the state of the board' do
      expect(board).to receive(:state=)
      described_class.new(board: board).call
    end

    it 'returns a Vita::Entities::Board' do
      result = described_class.new(board: board).call
      expect(result.class).to eq Vita::Entities::Board
    end

    context 'for each cell in the board' do
      it 'calls Vita::UseCases::Cell::ApplyRules' do
        cell = Vita::Entities::Cell.new
        allow(board.state).to receive(:each).and_yield(cell)
        allow_any_instance_of(Vita::UseCases::Cell::ApplyRules).to receive(:call).with(cell: cell, alive_neighbors: 1).and_return(cell)

        described_class.new(board: board).call
      end
    end
  end
end