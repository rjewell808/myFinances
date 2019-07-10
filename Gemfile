source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.5'

gem 'rails', 		'~> 5.2.0'
gem 'sqlite3'
gem 'puma', 		'~> 3.11'
gem 'sass-rails', 	'~> 5.0'
gem 'uglifier', 	'>= 1.3.0'
gem "bootstrap", ">= 4.3.1"
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', 	'~> 5'
gem 'jbuilder', 	'~> 2.5'
gem 'bootstrap-datepicker-rails'
gem 'bootsnap', 	'>= 1.1.0', require: false
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'jquery-rails',   '4.3.1'
gem 'pg', '1.1.4'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :production do
  
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
