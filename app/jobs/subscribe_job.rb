load "#{Rails.root}/lib/modules/pub_sub/subscriber.rb"

class SubscribeJob < ApplicationJob
  queue_as :responses
  retry_on Exception, wait: 300.seconds
  
  def perform_later
    subscriber = Subscriber.new
    subscriber.call
  end
end
