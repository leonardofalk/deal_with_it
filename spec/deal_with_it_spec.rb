class DummyHandler < DealWithIt::Handler
  deal StandardError, with: -> { puts 'ok' }
end

class DummyTrigger
  def initialize
    raise StandardError
  end

  def self.rescue_from(*klasses, with: nil, &block)
  end

  include DealWithIt
end

RSpec.describe DealWithIt do
  it 'has a version number' do
    expect(DealWithIt::VERSION).to_not be nil
  end

  describe 'descendants' do
    it 'includes the DummyHandler' do
      expect(DealWithIt::Handler.descendants).to eq [DummyHandler]
    end
  end
end
