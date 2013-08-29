require 'git'

desc "cleanup all"
task :clean do
  Git.clean(:force, :d)
  Git.reset(:hard)
end