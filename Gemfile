# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rails', '~> 7.0.2', '>= 7.0.2.3'
gem 'puma', '~> 5.0'

gem 'sprockets-rails'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'tailwindcss-rails'
gem 'sassc-rails'

gem 'counter_culture'
gem 'after_commit_action'

gem 'redis', '~> 4.0'
gem 'devise'
gem 'image_processing', '~> 1.2'

gem 'acts_as_votable'
gem 'city-state'
gem 'validate_email'

# gem 'material_icons', '~> 2.2', '>= 2.2.1'
# gem 'box-icon-rails', git: 'https://github.com/LeeCrey/box-icon-rails'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'bootsnap', require: false

group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'rdoc'
  gem 'bullet'
  gem 'psych', '~> 4.0'
  gem 'web-console'
  gem 'rack-mini-profiler'

  gem 'erb2haml'
  gem 'faker'
  gem 'annotate'
  gem 'letter_opener'
  gem 'rubocop-rails'
  gem 'rubocop-discourse'
end

group :production do
  gem 'pg'
end
