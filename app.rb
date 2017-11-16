require 'sinatra'
require 'sprockets'
require 'sass'
require 'uglifier'




# To run this in development, type: rackup -p 3000 -s puma

class Sba < Sinatra::Base

  set :environment, Sprockets::Environment.new

  # append assets paths
  environment.append_path "assets/stylesheets"
  environment.append_path "assets/javascripts"

  # compress assets
  environment.js_compressor  = :uglify
  environment.css_compressor = :scss

  # get assets
  get "/assets/*" do
    env["PATH_INFO"].sub!("/assets", "") # this is coming from sprockets gem
    settings.environment.call(env)
  end


  get '/' do
    erb :home
  end


end


