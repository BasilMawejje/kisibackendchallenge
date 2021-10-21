ActiveSupport::Notifications.subscribe "enqueue_retry.active_job" do |*args|
  event = ActiveSupport::Notifications::Event.new *args
  job_duration = event.payload[:wait]
  job_count = event.payload[:job].executions
  
  Rails.logger.info "job_duration - #{job_duration}, job_count - #{job_count}"

  # MyMetricsService.send(event)
end