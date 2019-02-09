require 'spec_helper'

RSpec.describe Vita::Entities::Board do

  it { should respond_to(:state) }
  it { should respond_to(:state=) }

  describe '#state' do
    it 'returns an array of Vita::Entities::Cell' do
      expect(subject.state.class).to eq Array
      expect(subject.state.map(&:class).uniq).to eq [Vita::Entities::Cell]
    end
  end

end