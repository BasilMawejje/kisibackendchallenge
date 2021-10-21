module PubSub
  def self.publish(topic, message)
    PublishJob.new.perform_later(topic, message)
  end

  def self.subscribe(subscription_id)
    SubscribeJob.new.perform_later(subscription_id)
  end
end