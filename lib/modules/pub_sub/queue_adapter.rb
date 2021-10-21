# Implementation of PubSub with `google-cloud-pubsub` client for Ruby.
# `QueueAdapter` sets up Google Pubsub making it available for use in other classes.

class QueueAdapter
  def self.call
    @pubsub = Google::Cloud::Pubsub.new(
      project_id: ENV['GOOGLE_CLOUD_PROJECT_ID'],
      credentials: ENV['GOOGLE_APPLICATION_CREDENTIALS']
    )
  end
end