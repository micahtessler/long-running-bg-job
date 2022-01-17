class EchoPidJob < ApplicationJob
    queue_as :default
  
    def perform(*args)
        logger.error("*********************** JOB PID: #{Process.pid} ##################")
    end
  
  end