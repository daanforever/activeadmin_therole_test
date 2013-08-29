require 'git'

desc "Cleanup all\n - git reset\n - git clean\n - rake db:drop\n - rake db:create"
task :clean do
  g = Git.open('.', :log => Logger.new(STDOUT))
  g.clean(force: true, d: true)
  g.reset('HEAD', hard: true)
  Rake::Task["db:drop"].invoke
  Rake::Task["db:create"].invoke
end