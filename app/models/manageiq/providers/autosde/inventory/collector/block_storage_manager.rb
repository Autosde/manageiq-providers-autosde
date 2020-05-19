# This class is supposed to collect raw output from the managed system
class ManageIQ::Providers::Autosde::Inventory::Collector::BlockStorageManager < ManageIQ::Providers::Inventory::Collector

  # @return [ManageIQ::Providers::Autosde::BlockStorageManager]
  attr_accessor :manager

  def collect
    new_inventory = {}

    new_inventory[:physical_storages] = []

    @manager.autosde_client.class::StorageSystemApi.new.storage_systems_get.each do |storage|
      #  @type [OpenapiClient::StorageSystem] storage
      new_inventory[:physical_storages] << {
          :name => storage.name,
          :uid_ems => storage.uuid,
          :ems_ref => storage.uuid,
      }
    end
    @inventory = new_inventory
  end
end
