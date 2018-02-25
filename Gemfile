source 'https://rubygems.org'

gem 'lograge'
gem 'rails', '~> 5.1.1'
gem 'puma', '~> 3.9.1'
gem 'tzinfo-data'
gem 'listen'
gem 'rails-controller-testing'

group :docker, :development, :test do
  gem 'rspec-rails', '~> 3.7'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
end

ruby "2.4.3"
