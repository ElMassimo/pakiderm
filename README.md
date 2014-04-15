Pakiderm
=====================

[![Gem Version](https://badge.fury.io/rb/pakiderm.svg)](http://badge.fury.io/rb/pakiderm)
[![Build Status](https://travis-ci.org/ElMassimo/pakiderm.svg)](https://travis-ci.org/ElMassimo/pakiderm)
[![Coverage Status](https://coveralls.io/repos/ElMassimo/pakiderm/badge.png)](https://coveralls.io/r/ElMassimo/pakiderm)
[![Inline docs](http://inch-pages.github.io/github/ElMassimo/pakiderm.svg)](http://inch-pages.github.io/github/ElMassimo/pakiderm)

Allows you to memoize simple methods and works only on ruby 2.0 or greater.

## Usage
```ruby
class Counter
  extend Pakiderm

  def increment
    @sum = 1 + @sum.to_i
  end

  memoize :increment, assignable: true
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
As you can see, you can also pass the `assignable` option, so that the memoized methods also provide an assignment operator to override the memoized value :smiley:.

## Background
Pakiderm uses `Module#prepend` to add the memoized method before yours in the method lookup path of your class. Your method is called by using 'super', because the class is an ancestor to the prepended module.

### Corolary
If you override a memoized method in a derived class, you alter the method chain, so the derived method won't be memoized unless you invoke memoize in the derived class as well.


## RDocs

You can view the **Pakiderm** documentation in RDoc format here:

http://rubydoc.info/github/ElMassimo/pakiderm/master/frames


License
--------

    Copyright (c) 2014 Máximo Mussini

    Permission is hereby granted, free of charge, to any person obtaining
    a copy of this software and associated documentation files (the
    "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish,
    distribute, sublicense, and/or sell copies of the Software, and to
    permit persons to whom the Software is furnished to do so, subject to
    the following conditions:

    The above copyright notice and this permission notice shall be
    included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
    NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
    LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
    OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
    WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
