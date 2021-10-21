# Receives messages via `Subscriber.new.call/1` with subscription_id param.
require 'google/cloud/pubsub'
load "#{Rails.root}/lib/modules/pub_sub/queue_adapter.rb"

class Subscriber
  
  def call(subscription_id)
    pubsub = QueueAdapter.call
    subscription = pubsub.subscription subscription_id
    subscriber   = subscription.listen do |received_message|
      Rails.logger.info "Received message: #{received_message.data}"
      received_message.acknowledge!
    end
    
    subscriber.start
    # Let the main thread sleep for 5 seconds so the thread for listening messages does not quit
    sleep 5
    subscriber.stop.wait!
  end
end