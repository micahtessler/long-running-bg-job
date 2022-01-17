class LongRunningJob < ApplicationJob
  queue_as :long_run
  unique :until_executed, lock_ttl: 6.minutes, on_conflict: ->(job) { job.logger.info "LongRunningJob #{job.job_id} prevented from running by lock" }

  def perform(*args)
    logger.error("*********************** STARTING JOB #{job_id} on PID: #{Process.pid} at #{DateTime.now.strftime('%H:%M:%S:%L')} ##################")
    sleep 120
    logger.error("*********************** COMPLETING JOB #{job_id} on PID: #{Process.pid} at #{DateTime.now.strftime('%H:%M:%S:%L')} ##################")
  end
end