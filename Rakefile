require 'fileutils'
require 'colorator'
require 'rake'
require 'stringex'

posts_dir = '_drafts'

desc "Begin a new post in #{posts_dir}"
task :p do
  require './_plugins/titlecase.rb'

  puts "What should we call this post for now? (e.g.: January 2014 Meetup)".bold.yellow
  name = STDIN.gets.chomp

  puts "What is the publish date of the article? (format %Y-%m-%d)".bold.yellow
  date =  STDIN.gets.chomp

  mkdir_p "#{posts_dir}"
  title = "#{name.gsub(/&/,'&amp;').titlecase}"
  filename = "#{posts_dir}/#{date}-#{name.to_url}.md"

  puts "Creating new post: #{filename}".bold.green
  open(filename, 'w') do |post|
    system "mkdir -p #{posts_dir}/";
    post.puts "---"
    post.puts "layout: event"
    post.puts "title: #{title.gsub(/&/,'&amp;').titlecase}"
    post.puts "when: #{date}T19:30"
    post.puts "ends: #{date}T22:30"
    post.puts "where: launcho|wooga"
    post.puts "---"
  end

  system "vim #{filename}"
end

desc 'Deploy'
task :d do
  require 'sweetie'

  puts "1. Building jekyll ..".bold.green
  system 'jekyll build'

  puts "2. Deploying site with lovely rsync ..".bold.green
  system "rsync -vru -e \"ssh\" --del ?site/* xa6195@xa6.serverdomain.org:/home/www/vimberlin/"

  puts "3. Done!".bold.green
end

desc "Startup Jekyll"
task :s do
  system "jekyll serve --watch"
end

task :default => :s
