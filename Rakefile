desc "Syncing comments"
task :sync_comments do
  puts "Updating comments ..."
  system "rsync -vru -e ssh xa6195@xa6.serverdomain.org:/home/www/stagingvimberlin/hashover/ hashover"
  puts "... done"
end

desc "Staging"
task :staging do
  system "rsync -vru -e \"ssh\" --del build/* xa6195@xa6.serverdomain.org:/home/www/stagingvimberlin"
  puts '# Please refer to http://vimberlin.wikimatze.de to visit the staging system'
end

