require 'rake'
require 'colorator'

desc 'Staging'
task :staging do
  system "sed -i 's/vimberlin.de/vimfest.wikimatze.de/g' config.toml"
  system 'hugo -F'

  puts 'Deploying site with lovely rsync ..'.bold.green

  system "rsync -vru -e \"ssh\" --del public/* xa6195@xa6.serverdomain.org:/home/www/stagingvimfest/"
  puts '# Please refer to https://vimfest.wikimatze.de to visit the staging system'.green
  system "sed -i 's/vimfest.wikimatze.de/vimberlin.de/g' config.toml"
end

desc 'Deploy'
task :deploy do
  puts 'Building hugo ..'.bold.green
  system 'hugo -F'

  puts 'Deploying site with lovely rsync ..'.bold.green

  system "rsync -vru -e \"ssh\" --del public/* xa6195@xa6.serverdomain.org:/home/www/vimberlin/"

  puts 'Done!'.green
end

desc 'Startup hugo'
task :s do
  puts 'hugo is finished with building..'.bold.green
  system 'hugo server -F'
end

task :default => :s

