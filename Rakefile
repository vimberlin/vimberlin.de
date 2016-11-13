require 'stringex'

class String
  def titlecase
    small_words = %w(a an and as at but by en for if in of on or the to v v. via vs vs.)

    x = split(" ").map do |word|
      # note: word could contain non-word characters!
      # downcase all small_words, capitalize the rest
      small_words.include?(word.gsub(/\W/, "").downcase) ? word.downcase! : word.smart_capitalize!
      word
    end
    # capitalize first and last words
    x.first.to_s.smart_capitalize!
    x.last.to_s.smart_capitalize!
    # small words after colons are capitalized
    x.join(" ").gsub(/:\s?(\W*#{small_words.join("|")}\W*)\s/) { ": #{$1.smart_capitalize} " }
  end

  def titlecase!
    replace(titlecase)
  end

  def smart_capitalize
    # ignore any leading crazy characters and capitalize the first real character
    if self =~ /^['"\(\[']*([a-z])/
      i = index($1)
      x = self[i,self.length]
      # word with capitals and periods mid-word are left alone
      self[i,1] = self[i,1].upcase unless x =~ /[A-Z]/ or x =~ /\.\w+/
    end
    self
  end

  def smart_capitalize!
    replace(smart_capitalize)
  end
end


desc "Syncing comments"
task :sync_comments do
  system "rm -rf hashover/"
  puts "Updating comments ..."
  system "rsync -vru -e ssh xa6195@xa6.serverdomain.org:/home/www/vimberlin/hashover/ hashover"
  puts "... done"
end

posts_dir = 'source'

desc "Begin a new post in #{posts_dir}"
task :post do
  puts "What should we call this post for now? (e.g.: January #{Time.now.year} Meetup)"
  name = STDIN.gets.chomp

  puts "What is the publish date of the article? (format %Y-%m-%d)"
  date =  STDIN.gets.chomp

  mkdir_p "#{posts_dir}"
  title = "#{name.gsub(/&/,'&amp;').titlecase}"
  filename = "#{posts_dir}/#{date}-#{name.to_url}.html.markdown.erb"

  puts "Creating new post: #{filename}"
  open(filename, 'w') do |post|
    system "mkdir -p #{posts_dir}/";
    post.puts "---"
    post.puts "title: #{title.gsub(/&/,'&amp;').titlecase}"
    post.puts "when: #{date}T19:00"
    post.puts "ends: #{date}T22:30"
    post.puts "where: inberlin|wunderlist|absolventa|bitcrowd|berlinonline|buero20|intimes|launcho|launchco_new|matthias|thoughtworks|travis|wooga"
    post.puts "---"
  end

  system "vim #{filename}"
end


desc "Staging"
task :staging do
  system "middleman b"
  system "rsync -vru -e \"ssh\" --del build/* xa6195@xa6.serverdomain.org:/home/www/stagingvimberlin"
  puts '# Please refer to http://vimberlin.wikimatze.de to visit the staging system'
end

desc "Deploy"
task :deploy => :sync_comments do
  system "middleman b"
  system "rsync -vru -e \"ssh\" --del build/* xa6195@xa6.serverdomain.org:/home/www/vimberlin"
  puts '# Please refer to http://vimberlin.de'
end
