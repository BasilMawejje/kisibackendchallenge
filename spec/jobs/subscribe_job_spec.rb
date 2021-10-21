require 'rails_helper'

RSpec.describe SubscribeJob, type: :job do
  include ActiveJob::TestHelper

  describe 'pulls published messages from Google Pubsub' do
    before do
      ActiveJob::Base.queue_adapter = :test
    end

    it 'should respond to #perform_later' do
      expect(described_class).to respond_to(:perform_later)
      expect(described_class.queue_name).to eq('responses')
      expect {described_class.perform_later}.to have_enqueued_job
    end
  end

  describe 'when Exception is raised' do
    before do
      allow_any_instance_of(described_class).to receive(:perform).and_raise(StandardError.new)
    end

    it 'receives retry_on 3 times' do
      allow_any_instance_of(described_class).to receive(:perform).and_raise(StandardError.new)
      allow_any_instance_of(described_class).to receive(:executions).and_return(3)
      described_class.perform_now
    end

    it 'calls #retry_on' do
      expect_any_instance_of(described_class).to receive(:retry_job)

      perform_enqueued_jobs do
        described_class.perform_later rescue StandardError
      end
    end
  end
end
