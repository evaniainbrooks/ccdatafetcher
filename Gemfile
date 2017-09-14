source 'https://rubygems.org'
ruby '2.4.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'daemons'
gem 'activerecord'
gem 'activejob'
gem 'delayed_job_active_record'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
gem 'json-schema'
gem 'require_all'

group :development, :test do
  gem 'rspec'
  gem 'simplecov'
  gem 'vcr'
  gem 'factory_girl'
end
