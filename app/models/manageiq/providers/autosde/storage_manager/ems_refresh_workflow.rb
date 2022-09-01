class ManageIQ::Providers::Autosde::StorageManager::EmsRefreshWorkflow < ManageIQ::Providers::EmsRefreshWorkflow

  def run_native_op
    # a step before the refresh, can be overwritten by a subclass
    signal(:abort, "Task failed")
    queue_signal(:poll_native_task)
  end

  def poll_native_task
    status = job.options[:ems].autosde_client.JobApi.jobs_pk_get(task_id).status
    if status == "FAILURE"
      signal(:abort, "Task failed")
    elsif status == "SUCCESS"
      queue_signal(:refresh)
      #else
      #queue_signal(:poll_native_task)
    end
  rescue => err
    _log.log_backtrace(err)
    signal(:abort, err.message, "error ADRIAN")
  end

end