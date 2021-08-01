require 'pretty_trace/enable-trim'

set :bind_address, "0.0.0.0"
set :build_dir, "docs"
set :css_dir, "assets/css"
set :js_dir, "assets/js"
set :images_dir, "assets/images"

set :slim, pretty: true, disable_escape: true

activate :directory_indexes
activate :asset_hash

if ENV['MIDDLEMAN_ENV'] == 'dev'
  set :sass_source_maps, true
else
  activate :minify_css
  activate :minify_javascript
end
