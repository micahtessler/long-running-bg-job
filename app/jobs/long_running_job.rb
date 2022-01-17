class LongRunningJob < ApplicationJob
  queue_as :long_run
    
  def perform(*args)
    logger.error("*********************** STARTING JOB #{job_id} on PID: #{Process.pid} at #{DateTime.now.strftime('%H:%M:%S:%L')} ##################")
    sleep 120
    logger.error("*********************** COMPLETING JOB #{job_id} on PID: #{Process.pid} at #{DateTime.now.strftime('%H:%M:%S:%L')} ##################")
  end
end