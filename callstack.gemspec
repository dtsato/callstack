GEMSPEC =Gem::Specification.new do |s|
  s.name = 'callstack'
  s.version = '0.0.2'
  s.date = "2008-11-14"
  s.rubyforge_project = "callstack"
  s.platform = Gem::Platform::RUBY
  s.summary, s.description = 'A simple extension to add better stack traces to Ruby 1.8 (based on http://eigenclass.org/hiki.rb?ruby+backtrace+data)'
  s.authors = 'Danilo Sato'
  s.email = 'danilo@dtsato.com'
  s.homepage = 'http://github.com/dtsato/callstack'
  s.has_rdoc = true
  s.rdoc_options += ['--quiet', '--title', 'Callstack', '--main', 'README.rdoc', '--inline-source']
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