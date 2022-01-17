class EchoPidWorker

    include Sidekiq::Worker
  
    def perform(*args)
        logger.error("*********************** WORKER PID: #{Process.pid} ##################")
    end
  
  end