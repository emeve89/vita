require 'spec_helper'

RSpec.describe Vita::Entities::Cell do

  it { should respond_to(:state)}

  describe '#set_new_state' do
    it 'receives all the cells around as parameter'

    context 'with conditions to die' do
      it 'sets state to ALIVE'
    end

    context 'with conditions to continue living' do
      it 'sets state to DEAD'
    end
  end

end