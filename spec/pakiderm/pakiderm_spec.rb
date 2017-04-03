require "spec_helper"

describe Pakiderm do
  Given(:counter_class) { Class.new(Counter) }
  Given(:counter) { counter_class.new }

  context "memoize" do
    def memoize(*args)
      counter_class.memoize(*args)
    end

    Given {
      memoize :increment
      memoize :empty?, :empty!, :decrement
    }

    context 'when calling a method without parameters' do
      When (:result) { counter.increment }
      Then { result == 1 }
      And  { counter.increment == result }
      And  { counter.increment == result }
    end

    context 'when method ends with a ? or a !' do
      Given {
        counter.empty!
        counter.increment
        counter.empty?
        counter.sum = 5
      }
      Then { counter.increment == 1 }
      And  { counter.empty! == 0 }
      And  { counter.empty?.nil? }
      And  { counter.sum == 5 }
    end
  end
end
