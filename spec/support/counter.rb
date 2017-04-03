class Counter
  extend Pakiderm

  attr_accessor :sum

  def initialize
    @sum = 0
  end

  def increment
    @sum += 1
  end

  def decrement
    @sum -= 1
  end

  def empty?
    true if @sum == 0
  end

  def empty!
    @sum = 0
  end
end
