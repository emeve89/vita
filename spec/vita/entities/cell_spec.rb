require 'spec_helper'

RSpec.describe Vita::Entities::Cell do
  it { should respond_to :state }
  it { should respond_to :state= }
end