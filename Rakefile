require 'rake'
require 'fileutils'
require 'stringex'

posts_dir = '_posts'

def say(text, color=:magenta)
  n = { :bold => 1, :red => 31, :green => 32, :yellow => 33, :blue => 34, :magenta => 35 }.fetch(color, 0)
  puts "\e[%dm%s\e[0m" % [n, text]
end

desc "Begin a new post in #{posts_dir}"
task :p do
  require './_plugins/titlecase.rb'

  say "What should we call this post for now?"
  name = STDIN.gets.chomp

  say "What is the publish date of the article? (format %Y-%m-%d)"
  date =  STDIN.gets.chomp

  mkdir_p "#{posts_dir}"
  title = "#{name.gsub(/&/,'&amp;').titlecase}"
  filename = "_posts/#{date}-#{name.to_url}.md"

  puts "Creating new post: #{filename}"
  open(filename, 'w') do |post|
    system "mkdir -p #{posts_dir}/";
    post.puts "---"
    post.puts "layout: post"
    post.puts "title: #{title.gsub(/&/,'&amp;').titlecase}"
    post.puts "---"
  end
end

desc "Startup Jekyll"
task :start do
  system "jekyll serve --watch"
end

task :default => :start
