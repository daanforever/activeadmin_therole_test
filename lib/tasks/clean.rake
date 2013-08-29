require 'git'

desc "Cleanup all (git reset and git clean)"
task :clean do
  g = Git.open('.', :log => Logger.new(STDOUT))
  g.clean(force: true, d: true)
  g.reset('HEAD', hard: true)
  Rake::Task["db:drop"].invoke
  Rake::Task["db:create"].invoke
end