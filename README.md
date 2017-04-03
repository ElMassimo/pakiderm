Pakiderm
=====================

[![Gem Version](https://badge.fury.io/rb/pakiderm.svg)](http://badge.fury.io/rb/pakiderm)
[![Build Status](https://travis-ci.org/ElMassimo/pakiderm.svg)](https://travis-ci.org/ElMassimo/pakiderm)
[![Coverage Status](https://coveralls.io/repos/github/ElMassimo/pakiderm/badge.svg?branch=master)](https://coveralls.io/github/ElMassimo/pakiderm?branch=master)
[![Inline docs](http://inch-ci.org/github/ElMassimo/pakiderm.svg)](http://inch-ci.org/github/ElMassimo/pakiderm)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/ElMassimo/queryable/blob/master/LICENSE.txt)

Allows you to unobtrusively memoize simple methods.

## Usage
```ruby
class Counter
  extend Pakiderm

  memoize \
  def increment
    @sum = 1 + @sum.to_i
  end
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
```
You can also pass a list of methods that should be memoized:
```ruby
memoize :complex_calculation, :api_response, :db_query
```

## Background
Pakiderm adds a method by using `Module#prepend` in order to"intercept" calls to the original method and provide memoization.

### Caveat
If you override the method in a subclass, Pakiderm's method won't be able to intercept calls to the subclass' method.

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
