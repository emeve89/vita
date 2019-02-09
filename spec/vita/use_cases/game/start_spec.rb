require 'spec_helper'

RSpec.describe Vita::UseCases::Game::Start do

  it 'creates a Vita::Entities::Board' do
    expect(Vita::Entities::Board).to receive(:new)
    described_class.new
  end

  it 'calls Vita::UseCases::Board::NextTick' do
    allow_any_instance_of(described_class).to receive(:loop).and_yield
    expect(Vita::UseCases::Board::NextTick).to receive_message_chain(:new, :call)
    described_class.new.call
  end
end