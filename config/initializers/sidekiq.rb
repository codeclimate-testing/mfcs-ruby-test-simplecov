Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://mfcs_redis:6379/12' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://mfcs_redis:6379/12' }
end