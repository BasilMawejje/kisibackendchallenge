# Publishes a message via `Publisher.new.call/2` with topic_id and message params
require 'google/cloud/pubsub'
load "#{Rails.root}/lib/modules/pub_sub/queue_adapter.rb"

class Publisher
  def call(topic_id, message)
    pubsub = QueueAdapter.call
    topic = pubsub.topic topic_id
    topic.publish message

    Rails.logger.info "Message - #{message} published."
  end
end