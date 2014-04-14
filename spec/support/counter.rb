class Counter
  extend Pakiderm

  attr_reader :sum

  def initialize
    @sum = 0
  end

  def increment
    @sum = @sum.to_i + 1
  end

  def decrement
    @sum = @sum.to_i - 1
  end

  def empty?
    @sum == 0
  end

  def empty!
    @sum = 0
  end

  memoize :increment, assignable: true
  memoize :empty?, :empty!, :decrement
end
