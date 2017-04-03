require File.expand_path("../lib/pakiderm/version", __FILE__)

Gem::Specification.new do |s|
  s.name = "pakiderm"
  s.version = Pakiderm::VERSION
  s.authors = ["Máximo Mussini"]
  s.email = ["maximomussini@gmail.com"]
  s.summary = "Pakiderm will never forget the return value."
  s.description = "Pakiderm is a simple module that encapsulates a modern memoization technique."
  s.homepage = "https://github.com/ElMassimo/pakiderm"
  s.license = "MIT"
  s.extra_rdoc_files = ["README.md"]
  s.files = Dir.glob("{lib}/**/*.rb") + %w(README.md)
  s.require_path = "lib"

  s.required_ruby_version = "~> 2.0"

  s.add_development_dependency "rspec-given", "~> 3.0"
end
