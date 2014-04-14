# Public: Mixin that adds memoization functionality to a plain ruby object.
# Memoization is selectively applied to methods by using the `memoize` method.
#
# Examples
#
#   class PersonQuery
#     extend Pakiderm
#     def recent_activity
#       NSA.get("/api/#{person.id}")
#     end
#     memoize :recent_activity
#   end
#
module Pakiderm

  # Public: Adds memoization to methods without parameters. Can receive a
  # single method name, or a list of methods, and an :assignable option that
  # when true will create an assignment method to modify the memoized value.
  #
  # names - Names of the methods to be memoized. Can take a hash of options as
  #         the last parameter. Only valid option is :assignable.
  #
  # Examples
  #
  #   memoize :tired?, :complex_formula, :long_running_method!
  #
  #   memoize :meaning_of_life, assignable: true
  #   # self.meaning_of_life = 42
  #
  # Returns nothing.
  def memoize(*names)
    assignable = names.last.is_a?(Hash) ? names.pop[:assignable] : false
    memoized = Module.new
    names.each do |name|
      ivar = Pakiderm.memoized_ivar_for(name)
      memoized.module_eval Pakiderm.memoized_method(name, ivar)
      memoized.module_eval Pakiderm.assignment_method(name, ivar) if assignable
    end
    prepend memoized
  end

  # Internal: Generates a memoized method string.
  #
  # name - Name of the method to memoize.
  #
  # ivar - Name of the instance variable used to store the memoized result.
  #
  # Returns a String with the code of the memoized method.
  def self.memoized_method(name, ivar)
    <<-MEMOIZATION
      def #{name}
        unless #{ivar}
          #{ivar} = [super]
        end
        #{ivar}[0]
      end
    MEMOIZATION
  end

  # Internal: Generates an assignment method for the memoized value.
  #
  # name - Name of the memoized method.
  #
  # ivar - Name of the instance variable used to store the memoized result.
  #
  # Returns a String with the code of the assignment method.
  def self.assignment_method(name, ivar)
    <<-ASSIGNMENT
      def #{name}=(value)
        #{ivar} = [value]
      end
    ASSIGNMENT
  end

  # Internal: Creates a valid instance variable name from a method name
  #
  # name - Name of the memoized method.
  #
  # Examples
  #
  #   Pakiderm.memoized_ivar_for(:empty?)
  #   # => '@_memoized_empty_query'
  #
  # Returns a String with the code of the assignment method.
  def self.memoized_ivar_for(name)
    "@_memoized_#{name.to_s.sub(/\?$/, '_query').sub(/!$/, '_bang')}"
  end
end
