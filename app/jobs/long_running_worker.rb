class LongRunningWorker
  include Sidekiq::Worker
  sidekiq_options queue: :long_run,
                  lock: :until_executed,
                  on_conflict: :log,
                  lock_ttl: 6.minutes
  
  def perform(*args)
    logger.error("*********************** STARTING WORKER #{jid} on PID: #{Process.pid} at #{DateTime.now.strftime('%H:%M:%S:%L')} ##################")
    sleep 120
    logger.error("*********************** COMPLETING WORKER #{jid} on PID: #{Process.pid} at #{DateTime.now.strftime('%H:%M:%S:%L')} ##################")
  end

end