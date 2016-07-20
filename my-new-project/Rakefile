desc "Build SassDoc Documentation"
task :sassdoc do
  status = system("sassdoc source/assets/stylesheets/ docs/")
  puts status ? "Documentation Generated" : "There was an issue creating the documentation. Do you have SassDoc installed?"
end