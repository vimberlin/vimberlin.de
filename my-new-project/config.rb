###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :url_root, 'http://vimberlin.de'

proxy '/blog', '/blog.html'
proxy '/legal', '/legal.html'

page '/*.xml', layout: false

activate :blog do |blog|
  blog.permalink = "/{title}"
  blog.layout = "blog_layout"
end

activate :search_engine_sitemap,
  default_priority: 0.5,
  default_change_frequency: "monthly"

configure :development do
  activate :livereload          # Reload the browser automatically whenever files change
  activate :disqus do |d|
    d.shortname = nil
  end
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :disqus do |d|
    d.shortname = 'vimberlin'
  end
end

