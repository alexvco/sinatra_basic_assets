require 'sinatra'
# require 'sinatra/asset_pipeline'

set :server, :puma
set :port, 3000

# To run this in development, type ruby app.rb

class Sba < Sinatra::Base
  # Include these files when precompiling assets
  set :assets_precompile, %w(app.js app.css *.png *.jpg *.svg *.eot *.ttf *.woff *.woff2)

  # The path to your assets
  set :assets_paths, %w(assets)

  # Use another host for serving assets
  set :assets_host, '<id>.cloudfront.net'

  # Which prefix to serve the assets under
  set :assets_prefix, 'custom-prefix'

  # Serve assets using this protocol (http, :https, :relative)
  set :assets_protocol, :http

  # CSS minification
  set :assets_css_compressor, :sass

  # JavaScript minification
  set :assets_js_compressor, :uglifier

  # Register the AssetPipeline extension, make sure this goes after all customization
  # register Sinatra::AssetPipeline

  get '/' do
    erb :home
  end
end






##---------------------------------------------------------------##
# You can modify the default "public" folder to an "asset" folder
##---------------------------------------------------------------##


# set :public_folder, Proc.new { File.join(root, "assets/css") }

# get('application.scss') { scss :styles}
# set :assets, Proc.new { Sprockets::Environment.new(root) {|env|
#   env.append_path File.join( root, "/assets/js")
#   env.append_path File.join(root, "/assets/css")
#   # more…
# }}



