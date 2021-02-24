Pakiderm [![Gem Version](https://badge.fury.io/rb/pakiderm.svg)](https://rubygems.org/gems/pakiderm) [![Build Status](https://github.com/ElMassimo/pakiderm/workflows/build/badge.svg)](https://github.com/ElMassimo/pakiderm/actions) [![Test Coverage](https://codeclimate.com/github/ElMassimo/pakiderm/badges/coverage.svg)](https://codeclimate.com/github/ElMassimo/pakiderm) [![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/ElMassimo/queryable/blob/master/LICENSE.txt)
=====================

Allows you to unobtrusively memoize methods without parameters.

```ruby
class Stopwatch
  extend Pakiderm

  def start
    @started_at = Time.now
  end

  def stop
    elapsed_time
  end

  memoize \
  def elapsed_time
    Time.now - @started_at
  end
end
```
Memoized methods will only be called the first time; the result will be stored and returned on subsequent invocations.
```ruby
stopwatch = Stopwatch.new
stopwatch.start
stopwatch.stop         # Example: 3.991826
stopwatch.elapsed_time #       => 3.991826
```
You can also pass a list of methods that should be memoized:
```ruby
memoize :complex_calculation, :api_response, :db_query
```

## Background
Pakiderm adds a method by using `Module#prepend` in order to"intercept" calls to the original method and provide memoization.

### Caveat
If you override the method in a subclass, Pakiderm's method won't be able to intercept calls to the subclass' method, so you would need to call `memoize` again in the subclass.
