source 'https://rubygems.org'

#gem ruby '2.0.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views

gem 'devise', '~> 3.0.0rc'

gem 'paperclip', '~> 3.5.1'

gem 'aws-sdk'

gem 'stripe', '~> 1.8.3'

gem 'httparty'

gem 'brakeman'

gem 'aasm'


gem 'paper_trail', '~> 3.0.0.beta', git: 'git://github.com/airblade/paper_trail.git'
group :development do
  gem 'mocha', require: false
  gem 'database_cleaner'
  gem 'rails_best_practices'
end

group :test do
  gem "minitest", "~> 4.7"
  gem "minitest-rails-capybara"
end

gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end


group :production do
  #gem "unicorn", "~> 4.7.0" # make sure you follow installation instructions for this gem
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
end
# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
