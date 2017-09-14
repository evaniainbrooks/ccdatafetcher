require 'active_record'
require 'active_job'
require 'delayed_job_active_record'
require 'yaml'
require 'require_all'
require_all 'src/models'
require_all 'src/jobs'

environment = ENV['ENV'] || 'development'
db_config = YAML::load(File.open('config/database.yml'))

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.configurations = db_config.stringify_keys
ActiveRecord::Base.establish_connection(environment.to_sym)

ActiveJob::Base.queue_adapter = :delayed_job
