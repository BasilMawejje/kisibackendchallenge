load "#{Rails.root}/lib/modules/pub_sub/publisher.rb"

class PublishJob < ApplicationJob
  queue_as :responses
  retry_on Exception, wait: 300.seconds

  def perform_later(topic_id, message)
    publisher = Publisher.new
    publisher.call(topic_id, message)
  end
end
