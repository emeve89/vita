require 'spec_helper'

RSpec.describe Vita::UseCases::Cell::ApplyRules do
  let(:use_case) { described_class.new }

  describe "#call" do
    it "returns a new Vita::Entities::Cell" do
      expect(use_case.call(cell: double("cell"), alive_neighbors: 1).class).to eq Vita::Entities::Cell
    end

    describe "first rule" do
      it "Any live cell with fewer than two live neighbors dies, as if by underpopulation." do
        cell = double("alive cell", state: 'ALIVE')
        result = use_case.call(cell: cell, alive_neighbors: 1)
        expect(result.state).to eq 'DEAD'

        result = use_case.call(cell: cell, alive_neighbors: 0)
        expect(result.state).to eq 'DEAD'
      end
    end

    describe "second rule" do
      it "Any live cell with two or three live neighbors lives on to the next generation." do
        cell = double("alive cell", state: 'ALIVE')
        [2, 3].each do |alive_neighbors|
          result = use_case.call(cell: cell, alive_neighbors: alive_neighbors)
          expect(result.state).to eq 'ALIVE'
        end
      end
    end

    describe "third rule" do
      it "Any live cell with more than three live neighbors dies, as if by overpopulation." do
        cell = double("alive cell", state: 'ALIVE')
        [4...8].each do |alive_neighbors|
          result = use_case.call(cell: cell, alive_neighbors: alive_neighbors)
          expect(result.state).to eq 'DEAD'
        end
      end
    end

    describe "fourth rule" do
      it "Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction." do
        cell = double("dead cell", state: 'DEAD')
        result = use_case.call(cell: cell, alive_neighbors: 3)
        expect(result.state).to eq 'ALIVE'
      end
    end
  end
end