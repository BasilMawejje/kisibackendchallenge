module PubSub
  def self.publish(topic, message)
    PublishJob.new.perform_later(topic, message)
  end

  def self.subscribe
    SubscribeJob.new.perform_later
  end
end