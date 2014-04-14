require 'spec_helper'
require './lib/pakiderm'
require 'support/counter'

describe Pakiderm do
  Given(:counter) { Counter.new }

  context 'when calling a method without parameters' do
    When (:result) { counter.increment }
    Then { result == 1 }
    And  { counter.increment == result }
    And  { counter.increment == result }
  end

  context 'when stepping over the memoized value' do
    When (:result) { counter.increment = 10}
    Then { result == 10 }
    And  { counter.increment == 10 }
  end

  context 'when method ends with a ? or a !' do
    When { counter.empty? && counter.empty! && counter.increment }
    Then { counter.empty? }
    And  { counter.empty! == 0 }
    And  { counter.sum == 1 }
  end

  context 'when not passing :assignable as true' do
    When(:result) { counter.decrement = 5 }
    Then { expect(result).to have_failed(NoMethodError) }
  end
end
