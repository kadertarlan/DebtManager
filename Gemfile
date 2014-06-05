source 'https://rubygems.org'

gem 'rails', '3.2.14'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production, :staging do
  gem "pg"
end

group :development, :test do
  gem "sqlite3-ruby", "~> 1.3.0", :require => "sqlite3"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :assets do
  gem 'twitter-bootstrap-rails'
end

gem "therubyracer"
gem "less-rails"

gem 'jquery-rails'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'devise'
gem 'nifty-generators'
gem 'fb_graph'
gem 'twitter'
gem 'delayed_job_active_record'
gem 'daemons'

gem 'quiet_assets', :group => :development

gem 'god'
gem 'faker'
gem 'populator'

gem 'rspec-rails', :group => [:development, :test]
gem 'factory_girl_rails'
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

gem "mocha", :group => :test
