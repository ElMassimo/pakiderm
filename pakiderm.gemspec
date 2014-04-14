Gem::Specification.new do |s|
  s.name = "pakiderm"
  s.version = '1.0.0'
  s.licenses = ['MIT']
  s.summary = "Pakiderm will never forget the return value."
  s.description = "Pakiderm is a simple module that encapsulates a modern memoization technique."
  s.authors = ["Máximo Mussini"]

  s.email = ["maximomussini@gmail.com"]
  s.extra_rdoc_files = ["README.md"]
  s.files = Dir.glob("{lib}/**/*.rb") + %w(README.md)
  s.homepage = %q{https://github.com/ElMassimo/pakiderm}

  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>=2.0'
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
end
