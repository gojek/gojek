# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

###
# Page options, layouts, aliases and proxies
###

# Page settings:
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page "/README.md", :directory_index => false

###
# General configuration
###
set :css_dir, 'assets/styles'
set :js_dir, 'assets/scripts'
set :images_dir, 'assets/images'
activate :directory_indexes

###
# Helpers
###
helpers do
  
  # Active page
  def is_page_active(page)
    current_page.url == page ? 'active' : ''
  end

end

###
# Development configuration
###
configure :development do

  activate :livereload

end

###
# Build-specific configuration
###
configure :build do

  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
  set :relative_links, true
  activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

end

