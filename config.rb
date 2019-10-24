# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

set :relative_links, true
set :css_dir, "stylesheets"
set :js_dir, "javascripts"
set :images_dir, "images"
set :fonts_dir, "fonts"

page "/*.xml", layout: false
page "/*.json", layout: false
page "/*.txt", layout: false

configure :development do
  activate :livereload
end

configure :build do |config|
  activate :directory_indexes
  activate :gzip
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :asset_host, host: "//#{ENV['CLOUDFRONT_DISTRIBUTION_ID']}.cloudfront.net"
end

activate :dotenv

activate :s3_sync do |s3_sync|
  s3_sync.bucket = ENV["AWS_BUCKET"]
  s3_sync.region = ENV["AWS_REGION"]
  s3_sync.aws_access_key_id = ENV["AWS_ACCESS_KEY_ID"]
  s3_sync.aws_secret_access_key = ENV["AWS_SECRET_ACCESS_KEY"]
  s3_sync.prefer_gzip = true
  s3_sync.delete = false
  s3_sync.after_build = false
  s3_sync.path_style = true
  s3_sync.reduced_redundancy_storage = false
  s3_sync.acl = "public-read"
  s3_sync.encryption = false
  s3_sync.prefix = ""
  s3_sync.version_bucket = false
  s3_sync.index_document = "index.html"
  s3_sync.error_document = "404.html"
end

require "lib/helpers/content_helpers"
require "lib/helpers/nav_helpers"
helpers ContentHelpers
helpers NavHelpers
