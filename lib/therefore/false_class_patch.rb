class FalseClass
  def therefore
    if block_given?
      self
    else
      Enumerator.new do
        # Empty enumerator
      end
    end
  end

  def otherwise *args, &block
    if args.empty?
      if block_given?
        yield self
      else
        Enumerator.new do |yielder|
          yielder << self
        end
      end
    else
      args.first.therefore(&block)
    end
  end
end
