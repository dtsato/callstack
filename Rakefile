require "rubygems"
require 'rake/rdoctask'
require 'rake/contrib/sshpublisher'

load 'callstack.gemspec'

desc 'Generate RDoc'
Rake::RDocTask.new do |task|
  task.main = 'README.rdoc'
  task.title = 'callstack'
  task.rdoc_dir = 'doc'
  task.options << "--line-numbers" << "--inline-source"
  task.rdoc_files.include('README.rdoc', 'ext/**/*')
end

desc "Upload RDoc to RubyForge"
task :publish_rdoc do
  Rake::Task[:rdoc].invoke
  Rake::SshDirPublisher.new("dtsato@rubyforge.org", "/var/www/gforge-projects/callstack", "doc").upload
end

task(:lf) {p Dir["lib/**/*rb"]}

task(:check_gemspec) do
  require 'rubygems/specification'
  data = File.read('callstack.gemspec')
  spec = nil
  Thread.new { spec = eval("$SAFE = 3\n#{data}") }.join
  puts spec
end