Gem::Specification.new do |s|
  s.name = "simple_memoizer"
  s.version = '0.1.0'
  s.licenses = ['MIT']
  s.summary = "Simple memoization for simple methods"
  s.description = "Simple Memoizer is a helper module that encapsulates a modern memoization technique."
  s.authors = ["Máximo Mussini"]

  s.email = ["maximomussini@gmail.com"]
  s.extra_rdoc_files = ["README.md"]
  s.files = Dir.glob("{lib}/**/*.rb") + %w(README.md)
  s.homepage = %q{https://github.com/ElMassimo/simple_memoizer}

  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>=2.0'
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'activesupport'
end
