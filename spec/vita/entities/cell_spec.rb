require 'spec_helper'

RSpec.describe Vita::Entities::Cell do
  it { should respond_to :state }

  describe '#set_state' do
    context 'with valid state' do
      it 'sets a new state' do
        subject.set_state('ALIVE')
        expect(subject.state).to eq 'ALIVE'

        subject.set_state('DEAD')
        expect(subject.state).to eq 'DEAD'
      end

      it 'returns a Vita::Entities::Cell' do
        expect(subject.set_state('ALIVE').class).to eq Vita::Entities::Cell
      end
    end
    context 'with invalid state' do
      it 'raises an error' do
        expect{subject.set_state('INVALID')}.to raise_error(ArgumentError)
      end
    end
  end
end