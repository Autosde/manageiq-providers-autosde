class ManageIQ::Providers::Autosde::StorageManager::EventCatcher::Runner < ManageIQ::Providers::BaseManager::EventCatcher::Runner
  # This is the main method run in the first thread by the core event catcher runner.
  # It is responsible for retrieving events from the provider and putting them on
  # an internal queue for the core runner thread to parse and put on MiqQueue.
  def monitor_events
    # Start up our event monitor
    require "byebug"
    byebug
    event_monitor_handle.start

    # Tell the core runner thread that the event monitor is started.  The worker
    # won't be marked as "running" until this happens.
    event_monitor_running

    # And finally poll for events.  This should be implemented as a blocking method
    # which yields events caught from the provider
    event_monitor_handle.poll do |event|
      @queue.enq(event)
    end
  ensure
    stop_event_monitor
  end

  # This method is called by core when shutting down the event catcher
  def stop_event_monitor
    event_monitor_handle.stop
  end

  # This is called by the core runner thread to parse and put the event on the queue.
  def queue_event(event)
    event_hash = ManageIQ::Providers::Autosde::StorageManager::EventParser.event_to_hash(event, @cfg[:ems_id])
    EmsEvent.add_queue('add', @cfg[:ems_id], event_hash)
  end

  private

  # The Stream class isn't a requirement but helps to encapsulate the logic of
  # fetching events from the provider.
  def event_monitor_handle
    @event_monitor_handle ||= begin
      self.class.parent::Stream.new
    end
  end
end