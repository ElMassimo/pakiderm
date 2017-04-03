# Public: Mixin that adds memoization functionality to a plain ruby object.
# Memoization is selectively applied to methods by using the `memoize` method.
#
# Examples
#
#   class PersonQuery
#     extend Pakiderm
#
#     memoize \
#     def recent_activity
#       NSA.get("/api/#{person.id}")
#     end
#   end
#
module Pakiderm
  # Public: Adds memoization to methods without parameters using Module#prepend.
  #
  # names - Names of the methods to be memoized.
  #
  # Examples
  #
  #   memoize :tired?, :complex_formula, :long_running_method!
  #
  # Returns nothing.
  def memoize(*names)
    prepend Module.new {
      names.each do |name|
        ivar = Pakiderm.memoized_ivar_for(name)

        define_method(name) {
          if instance_variable_defined?(ivar)
            instance_variable_get(ivar)
          else
            instance_variable_set(ivar, super())
          end
        }
      end
    }
  end

  # Internal: Creates a valid name for the instance variable used to store the
  # memoized value for a method.
  #
  # name - Name of the method to memoize.
  #
  # Returns a String.
  def self.memoized_ivar_for(name)
    "@pakiderm_#{ name.to_s.gsub('?', '_question_mark').sub('!', '_bang') }"
  end
end
