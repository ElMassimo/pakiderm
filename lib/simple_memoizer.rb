module SimpleMemoizer
  extend ActiveSupport::Concern

  module ClassMethods
    def memoize(*method_names)
      method_names.flatten!
      memoized_module = Module.new do
        method_names.each do |name|
          memoized_ivar = SimpleMemoizer.memoized_ivar_for(name)
          module_eval <<-EVAL
            def #{name}
              unless #{memoized_ivar}
                #{memoized_ivar} = [super]
              end
              #{memoized_ivar}[0]
            end

            def #{name}=(value)
              #{memoized_ivar} = [value]
            end
          EVAL
        end
      end
      prepend memoized_module
    end
  end

  def self.memoized_ivar_for(symbol)
    "@_memoized_#{symbol.to_s.sub(/\?\Z/, '_query').sub(/!\Z/, '_bang')}".to_sym
  end
end
