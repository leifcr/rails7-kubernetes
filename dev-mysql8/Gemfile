source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.3"

gem 'rails', '~> 7.0'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Better logging
gem 'lograge'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

gem 'rails-i18n'

# Pagination
gem 'kaminari'

# Mysql
gem 'mysql2', '~> 0.5.0'

gem 'haml'
gem 'haml-rails'

# gem 'autoprefixer-rails'


# For sass stylesheets.
gem 'sassc-rails'

# gem 'font-awesome-sass', '~> 5.8'
# gem 'bootstrap'

# Catch bugs...
gem 'rollbar'

group :staging, :production do
  # Profiler
  # Note: Cannot use skylight in production, as it cannot filter out kubernetes alive checks
  # gem 'skylight'

  # Use to passenger for serving static assets
  # For using puma in production, the rails deployment package must include
  # a 'sidekart nginx' to serve static assets, or you must include
  gem 'passenger', require: 'phusion_passenger/rack_handler'
  gem 'sidekiq-alive-next' # Supports sidekiq 7+
end

# gem 'delayed_job'
# gem 'delayed_job_active_record'

# Background workers
gem 'sidekiq'

# Unique activejobs...
gem 'activejob-uniqueness'

# Forms
gem 'simple_form'
gem 'country_select' # rubocop:disable Bundler/OrderedGems - countries must be after country_select
gem 'countries' # rubocop:disable Bundler/OrderedGems

# Authentication
# See https://github.com/heartcombo/devise/issues/5326#issuecomment-776627602
# Switch back to released version, as soon as new version is released
# gem "devise", github: "heartcombo/devise", branch: "master"
gem 'devise'
gem 'devise-i18n'

gem 'omniauth'
# gem 'omniauth-facebook'
# gem 'omniauth-github'
gem 'omniauth-google-oauth2'
# gem 'omniauth-linkedin-oauth2'
gem 'omniauth-rails_csrf_protection'

# Authorization
gem 'pundit'

# For simple search, ransack can be used
gem 'ransack'

# For sitemaps
# gem 'sitemap_generator'

# NOTE: slugs from friendly_id must be saved in history with paper_trail, or stored in separate table to allow historical routing
# gem 'friendly_id'

# gem 'hashie' # used by content on json data
# gem 'hashie-forbidden_attributes' # To fix strong params issue
# Alternative: use virtus models instead of hashie serialized cols
# gem 'virtus'

# For inlining css on emails (gmail + others remove css styles...)
# gem 'inky-rb', require: 'inky'
# gem 'premailer-rails'

# For validating email addresses
# gem 'valid_email2'

# For trailing all changes...?
# gem 'paper_trail'

# Enable both if memecache is used
# Caching in memcached through dalli
# gem 'dalli'
# Connection pooling
# gem 'connection_pool'

# External requests?
# gem 'excon'   # for using excon faraday adapter
# gem 'faraday' # do http requests over tons of adapters...

# Powerful and easy enums
gem 'enumerize'

# For prettier pagination in urls
# gem 'routing-filter'
# For truncating html
# gem 'truncate_html'

# slack if needed
# gem 'slack-ruby-client'

# Easy calculation of boxes in a e-commerce context. Throw box dimensions + weights at it, and get boxes with total weight back.
# gem 'easy-box-packer', github: 'leifcr/easy-box-packer'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'puma'
  gem 'rspec-rails'
  gem 'rspec-retry'

  gem 'bullet' # n+1 queries finder
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'

  gem 'capybara-screenshot'

  gem 'timecop'

  gem "selenium-webdriver"

  # For testing on selenium against ff, chrome, edge and ie
  # gem 'webdrivers'

  # gem 'rails-controller-testing'

  # Coverage
  # gem 'simplecov', require: false
  # gem 'simplecov-rcov', require: false
end
group :development do
  # # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
  # gem 'spring-commands-rspec'

  # gem 'i18n-tasks' # To check for missing/unused translations

  # Note, remove binding_of_caller and/or better_errors if debugging is slow
  # See https://github.com/charliesome/better_errors/issues/341
  # gem 'better_errors'
  # gem 'binding_of_caller'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'

  gem 'debug'

  # For reloading during devel
  gem 'guard-livereload', require: false
  gem 'guard-rspec', require: false

  # Allow mailer_preview to have access to params
  # gem 'mailer_preview_request_model'

  # Better ruby/rails console
  # gem 'pry-rails'
  # gem 'pry-toys'
  # Issues with rails 6 + pry-byebug
  # gem 'pry-byebug'

  gem 'rubocop-rails'
end
