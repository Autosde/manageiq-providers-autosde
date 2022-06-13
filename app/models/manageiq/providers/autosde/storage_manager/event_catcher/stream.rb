class ManageIQ::Providers::Autosde::StorageManager::EventCatcher::Stream
  attr_reader :ems, :stop_polling, :poll_sleep

  def initialize(ems, options = {})
    @ems = ems
    @stop_polling = false
    @poll_sleep = options[:poll_sleep] || 20.seconds
  end

  def start
    @stop_polling = false
  end

  def stop
    @stop_polling = true
  end

  def poll
    since = nil

    loop do
      ems.with_provider_connection(:service => "Events") do |events_client|
        # Replace with your provider's events API
        events = events_client.get_events(:since => since)
        since = Time.now.utc

        break if stop_polling

        events.each { |event| yield event }
      end
      sleep(poll_sleep)
    end
  end
end