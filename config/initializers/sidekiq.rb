Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://127.0.0.1:6379/14' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://127.0.0.1:6379/14' }
end

Sidekiq.options[:poll_interval] = 1
schedule_file = "config/schedule.yml"

if File.exists?(schedule_file) && Sidekiq.server?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end
