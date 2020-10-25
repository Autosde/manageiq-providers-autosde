class ManageIQ::Providers::Autosde::StorageManager::PhysicalStorage < ::PhysicalStorage
  supports :create
  supports :delete do
    unsupported_reason_add(:delete, _("The Physical Storage is not connected to an active Manager")) if ext_management_system.nil?
  end

  def raw_delete_physical_storage
    ems = ext_management_system
    ems.autosde_client.StorageSystemApi.storage_systems_pk_delete(ems_ref)
    EmsRefresh.queue_refresh(ems)
  end

  # @param [ManageIQ::Providers::Autosde] _ext_management_system
  def self.raw_create_physical_storage(_ext_management_system, _options = {})
    sys_to_create = _ext_management_system.autosde_client.StorageSystemCreate(
      :name           => _options['name'],
      :password       => _options['password'],
      :user           => _options['user'],
      :system_type    => PhysicalStorageFamily.find(_options['physical_storage_family_id']).name,
      :auto_add_pools => true,
      :auto_setup     => true,
      :management_ip  => _options['management_ip'],
      :storage_family => "ontap_7mode"
    )

    begin
      _ext_management_system.autosde_client.StorageSystemApi.storage_systems_post(sys_to_create)
    ensure
      EmsRefresh.queue_refresh(_ext_management_system)
    end
  end
end
