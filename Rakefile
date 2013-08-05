require 'fileutils'
require 'colorator'
require 'rake'
require 'stringex'

posts_dir = '_posts'

desc "Begin a new post in #{posts_dir}"
task :p do
  require './_plugins/titlecase.rb'

  puts "What should we call this post for now?".bold.yellow
  name = STDIN.gets.chomp

  puts "What is the publish date of the article? (format %Y-%m-%d)".bold.yellow
  date =  STDIN.gets.chomp

  mkdir_p "#{posts_dir}"
  title = "#{name.gsub(/&/,'&amp;').titlecase}"
  filename = "_posts/#{date}-#{name.to_url}.md"

  puts "Creating new post: #{filename}".bold.green
  open(filename, 'w') do |post|
    system "mkdir -p #{posts_dir}/";
    post.puts "---"
    post.puts "layout: post"
    post.puts "title: #{title.gsub(/&/,'&amp;').titlecase}"
    post.puts "---"
  end

  system "vim #{filename}"
end

desc "Startup Jekyll"
task :s do
  system "jekyll serve --watch"
end

task :default => :start
