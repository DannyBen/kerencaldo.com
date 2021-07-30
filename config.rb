require 'sasstool'
require 'pretty_trace/enable-trim'

set :bind_address, "0.0.0.0"
set :build_dir, "docs"
set :css_dir, "assets/css"
set :js_dir, "assets/js"
set :images_dir, "assets/images"

set :slim, pretty: true, disable_escape: true

configure :build do
  # activate :minify_css
  # activate :minify_javascript
  activate :asset_hash
  activate :directory_indexes
end

after_build do
  # Create sourcemap
  puts "after_build:"
  file = "source/assets/css/site.css.scss"
  sass = Sasstool::Renderer.new file
  sass.render
  source_map = sass.source_map
  source = Dir["docs/assets/css/*.css"].first
  target = "#{source}.map"
  File.write target, source_map
  
  open(source, 'a') do |f|
    f << "\n\n/*# sourceMappingURL=#{File.basename target} */\n"
  end

  puts "- Saved source map: #{target}"
end
