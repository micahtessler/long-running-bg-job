Sidekiq.configure_server do |config|
#    config.redis = { url: ENV["REDIS_URL"], driver: :hiredis }
  
  config.client_middleware do |chain|
    chain.add SidekiqUniqueJobs::Middleware::Client
  end
  
  config.server_middleware do |chain|
    chain.add SidekiqUniqueJobs::Middleware::Server
  end
  
  SidekiqUniqueJobs::Server.configure(config)
end
  
Sidekiq.configure_client do |config|
#    config.redis = { url: ENV["REDIS_URL"], driver: :hiredis }
  
  config.client_middleware do |chain|
    chain.add SidekiqUniqueJobs::Middleware::Client
  end
end

SidekiqUniqueJobs.configure do |config|
    config.logger = Sidekiq.logger # default, change at your own discretion
    config.debug_lua       = false # Turn on when debugging
    config.lock_info       = false # Turn on when debugging
    config.lock_ttl        = 600   # Expire in seconds based on the longest running job time
    config.lock_timeout    = nil   # turn off lock timeout
    config.max_history     = 0     # Turn on when debugging
    config.reaper          = :ruby # :ruby, :lua or :none/nil
    config.reaper_count    = 1000  # Stop reaping after this many keys
    config.reaper_interval = 600   # Reap orphans every 10 minutes
    config.reaper_timeout  = 150   # Timeout reaper after 2.5 minutes
  end