Pakiderm
=====================

Allows you to memoize simple methods and works only on ruby 2.0.

## Usage
```ruby
class Counter
  extend Pakiderm

  def increment
    @sum = 1 + @sum.to_i
  end

  memoize :increment
end
```
Your method will only be called the first time, the result will be stored and returned on subsequent invocations.
```irb
counter = Counter.new
=> Counter

counter.increment
=> 1

counter.increment
=> 1

counter.increment = 5
=> 5

counter.increment
=> 5
```
As you can see, it also provides an assignment operator, so you can override the memoized value :smiley:.

## Background
Pakiderm uses Module#prepend to add the memoized method before yours in the method lookup path of your class. Your method is called by using 'super', because the class is an ancestor to the prepended module.

### Corolary
If you override a memoized method in a derived class, you alter the method chain, so the derived method won't be memoized unless you invoke memoize in the derived class as well.
