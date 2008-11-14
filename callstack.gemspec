GEMSPEC =Gem::Specification.new do |s|
  s.name = 'callstack'
  s.version = '0.0.1'
  s.platform = Gem::Platform::CURRENT
  s.summary, s.description = 'A simple extension to add better stack traces to Ruby 1.8 (based on http://eigenclass.org/hiki.rb?ruby+backtrace+data)'
  s.authors = 'Danilo Sato'
  s.email = 'danilo@dtsato.com'
  s.homepage = 'http://callstack.rubyforge.org'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc']
  s.extensions << 'ext/extconf.rb'
  s.files = [
    "README.rdoc",
    "CHANGELOG",
    "callstack.gemspec",
    "ext/extconf.rb",
    "ext/CallStack.c"
  ]
end