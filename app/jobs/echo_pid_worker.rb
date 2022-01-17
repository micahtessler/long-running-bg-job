class EchoPidWorker

  include Sidekiq::Worker
  sidekiq_options queue: 'default'
  
  def perform(*args)
    logger.error("*********************** WORKER PID: #{Process.pid} ##################")
  end
  
end