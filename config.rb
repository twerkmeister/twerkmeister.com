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

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

SITE_NAME                       = 'Twerkmeister'
URL_ROOT                        = 'http://twerkmeister.com'
AWS_BUCKET                      = 'twerkmeister.com'

# Common configuration below here, should not need to be changed.
#------------------------------------------------------------------------


# Sent in on CLI by rake task
#------------------------------------------------------------------------
AWS_ACCESS_KEY                  = ENV['AWS_ACCESS_KEY']
AWS_SECRET                      = ENV['AWS_SECRET']


set :css_dir, 'css'

set :js_dir, 'js'

set :images_dir, 'img'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

# https://github.com/fredjean/middleman-s3_sync
activate :s3_sync do |s3_sync|
  s3_sync.bucket                     = AWS_BUCKET # The name of the S3 bucket you are targeting. This is globally unique.
  s3_sync.region                     = 'eu-central-1'     # The AWS region for your bucket. (S3 no longer requires this, dummy input?)
  s3_sync.aws_access_key_id          = AWS_ACCESS_KEY
  s3_sync.aws_secret_access_key      = AWS_SECRET
  # s3_sync.delete                     = true # We delete stray files by default.
  # s3_sync.after_build                = false # We do not chain after the build step by default.
  # s3_sync.prefer_gzip                = true
  # s3_sync.path_style                 = true
  # s3_sync.reduced_redundancy_storage = false
  # s3_sync.acl                        = 'public-read'
  # s3_sync.encryption                 = false
  # s3_sync.prefix                     = ''
  # s3_sync.version_bucket             = false
end

