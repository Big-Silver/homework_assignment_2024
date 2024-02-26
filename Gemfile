source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.0.8"
gem "sprockets-rails"
gem 'pg', '~> 1.1'
gem "puma"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'jsonapi.rb', '~> 2.0.1'

group :development, :test do
  gem 'rspec-rails', '~> 6.1.0'
  gem 'faker'
  gem 'factory_bot_rails'
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "faker"
  gem 'pry-rails', '~> 0.3.9'
end

group :development do
  gem 'annotate'
  gem "web-console"
end
