require 'rails_helper'
require "#{Rails.root}/lib/modules/pub_sub/pub_sub.rb"

describe 'PubSub' do
  before do
    @topic = 'responses'
    @message = 'Sample message'
    @subscription_id = 'responses-subscription'
  end
  it 'calls publish method' do
    expect(PubSub).to receive(:publish).with(@topic, @message)
    PubSub.publish(@topic, @message)
  end

  it 'calls publish method' do
    expect(PubSub).to receive(:subscribe).with(@subscription_id)
    PubSub.subscribe(@subscription_id)
  end
end