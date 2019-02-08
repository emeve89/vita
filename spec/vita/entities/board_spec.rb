require 'spec_helper'

RSpec.describe Vita::Entities::Board do

  it { should respond_to(:state) }

  describe '#state' do
    it 'returns an array of Vita::Entities::Cell'
  end

end