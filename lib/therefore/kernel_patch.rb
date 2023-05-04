module Kernel
  def therefore
    if block_given?
      yield self
    else
      Enumerator.new do |yielder|
        yielder << self
      end
    end
  end

  def otherwise *_args
    if block_given?
      self
    else
      Enumerator.new do
        # Empty enumerator
      end
    end
  end
end
