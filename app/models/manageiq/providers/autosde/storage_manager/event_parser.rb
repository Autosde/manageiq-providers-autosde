module ManageIQ::Providers::Autosde::StorageManager::EventParser
  def self.event_to_hash(event, ems_id)
    require "byebug"
    byebug
    event_hash = {
      :event_type => event[:event_name],
      :source     => "AUTOSDE",
      :ems_ref    => event[:id],
      :timestamp  => event[:time],
      :full_data  => event,  # Make sure this serializes properly and isn't dumping a native object
    }

    # Parse any additional information e.g. instances, images, etc...
    case event_hash[:event_type]
    when /com.autosde.vm/
      parse_vm_event!(event, event_hash)
    end

    event_hash
  end

  def self.parse_vm_event!(event, event_hash)
    return if event[:vm].nil?

    # The uid_ems/ems_ref should match the attributes that you set in the inventory
    # parser since they will be used to lookup the VM object by the MiqEventHandler
    event_hash[:vm_uid_ems] = event.dig(:vm, :id)
    event_hash[:vm_ems_ref] = event.dig(:vm, :id)
    event_hash[:vm_name]    = event.dig(:vm, :name)
  end
end