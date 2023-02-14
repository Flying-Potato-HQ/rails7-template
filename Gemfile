# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.1"
gem 'aws-sdk-s3', '~> 1.119', '>= 1.119.1'


gem "rails", "7.0.4.2"
gem "sprockets-rails", "3.4.2"
gem "importmap-rails", "1.1.5"                          # Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "jbuilder", "2.11.5"                                # Build JSON APIs with ease [https://github.com/rails/jbuilder]

# Datobase

gem 'pg', '1.4.5'
gem 'pgslice'
gem 'pg_query'
gem 'marginalia'
gem 'scenic'                                            #   Views, MViews, https://github.com/scenic-views/scenic
gem 'connection_pool'                                   #   https://github.com/mperham/connection_pool

# Caching

gem "redis", "5.0.5"
gem "kredis"                                            # Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]

# Jobs

gem "sidekiq", "7.0.2"
gem "whenever", "1.0.0", require: false # Cron based periodical jobs

# User Auth / Roles Etc

gem "devise", "4.8.1"
gem 'devise-i18n', '~> 1.10'                            #     https://github.com/tigrish/devise-i18n
gem "bcrypt", "~> 3.1.7"                                #     Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem 'pundit', '~> 2.3'                                  #     https://github.com/varvet/pundit
gem "rolify"                                            #     https://github.com/RolifyCommunity/rolify

gem 'omniauth-oauth2', '~> 1.8'                         #     https://github.com/omniauth/omniauth-oauth2
gem 'omniauth-facebook', '~> 9.0'                       #     https://github.com/simi/omniauth-facebook
gem 'omniauth-saml', '~> 2.1'                           #     https://github.com/omniauth/omniauth-saml
gem 'omniauth-twitter', '~> 1.4'                        #     https://github.com/arunagw/omniauth-twitter
gem 'omniauth-github', '~> 2.0', '>= 2.0.1'             #     https://github.com/omniauth/omniauth-github


# Frontend

gem "turbo-rails", "1.3.2"                              # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "stimulus-rails", "1.2.1"                           # Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'chart-js-rails'                                    # https://github.com/coderbydesign/chart-js-rails
gem 'popper_js'                                         # https://github.com/glebm/popper_js-rubygem

# Logging and Maintenance Related
gem 'awesome_print'
gem 'pghero'

# Security / CORS
gem 'rack-cors'

# Utility

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", "1.15.0", require: false                # Reduces boot times through caching; required in config/boot.rb
gem "image_processing", "~> 1.2"                        # Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem 'declarative-option', '~> 0.1.0'                    # https://github.com/apotonick/declarative-option
gem 'equalizer', '~> 0.0.11'                            # https://github.com/dkubb/equalizer
gem 'naturally', '~> 2.2', '>= 2.2.1'                   # https://github.com/dogweather/naturally
gem 'powerpack', '~> 0.1.3'                             # https://github.com/bbatsov/powerpack

# Exporters

gem 'smarter_csv', '~> 1.7', '>= 1.7.2'                 #       https://github.com/tilo/smarter_csv


# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "5.6.5"
gem 'config', "4.1.0", github: 'rubyconfig/config'
gem 'chewy', "7.2.7"                    # Full-text ElasticSearch + Chewy
gem "sanitize", "6.0.0"                 # User's input sanitization
gem "kaminari", "1.2.2"                 # Pagination


group :development, :test do
  gem 'aws-sdk', '~> 3'
  gem 'aws-sdk-codebuild'
  gem "debug", "1.7.1", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails", "6.0.1"

  gem 'annotate', github: 'excid3/annotate_models', branch: 'rails7'
  gem "faker", "3.1.0"
  gem "factory_bot_rails"
  gem 'stackprof'                                       #      https://github.com/tmm1/stackprof

  # Styling
  gem "rubocop-rails", "2.17.4", require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop', require: false

  # Debugging
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "pry-rails"
  gem "pry-byebug", platform: :ruby
  gem "pry-remote"
  gem "better_errors"
  gem "binding_of_caller"

  gem 'rotoscope', '~> 0.3.0'                           #      https://github.com/Shopify/rotoscope
  gem 'heap-profiler', '~> 0.5.0'                       #      https://github.com/Shopify/heap-profiler

  # Query Related
  gem 'query_count'
  gem 'prosopite', '~> 1.1'
  gem 'active_record_query_trace', '~> 1.8'
  gem 'activerecord-explain-analyze', '~> 0.1.0'

  gem 'coveralls', require: false
  gem 'simplecov', require: false
  gem 'erb_lint', require: false
  gem 'letter_opener_web', '~> 2.0'
  gem 'standard', require: false
  gem 'rails-route-checker', require: false

  # Security tooling to
  gem 'brakeman'
  gem 'bundler-audit', github: 'rubysec/bundler-audit'
end



group :development do
  gem "web-console", "4.2.0"            # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "rack-mini-profiler"              # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  gem "spring"

  gem 'overcommit', require: false      #
  gem 'database_consistency'
  gem 'benchmark-ips', require: false
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara", "3.38.0"
  gem "selenium-webdriver", "4.7.1"
  gem "webdrivers", "5.2.0"
end
