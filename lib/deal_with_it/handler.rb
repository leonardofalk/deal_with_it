class DealWithIt::Handler
  DEFAULT_EXCEPTION_HANDLER = ->(error) { raise error }.freeze

  attr_reader :exception, :callback

  def self.deal(exception, with: DEFAULT_EXCEPTION_HANDLER)
    @handler = new(exception, with)
  end

  def self.descendants
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end

  private

  def initialize(exception, with)
    @exception = exception
    @callback  = with
  end
end
