require 'spec_helper'

RSpec.describe Vita::UseCases::Game::Start do

  let(:presenter) { double('presenter') }

  it 'creates a Vita::Entities::Board' do
    expect(Vita::Entities::Board).to receive(:new)
    described_class.new(presenter: presenter)
  end

  it 'calls Vita::UseCases::Board::NextTick' do
    allow_any_instance_of(described_class).to receive(:loop).and_yield
    allow(presenter).to receive(:call).once
    expect(Vita::UseCases::Board::NextTick).to receive_message_chain(:new, :call)
    described_class.new(presenter: presenter).call
  end

  it 'calls the presenter' do
    allow_any_instance_of(described_class).to receive(:loop).and_yield
    expect(Vita::UseCases::Board::NextTick).to receive_message_chain(:new, :call)
    expect(presenter).to receive(:call).once
    described_class.new(presenter: presenter).call
  end
end