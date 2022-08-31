# manageiq/app/models/service/linking_workflow.rb uses it. It bypasses the poll_native_task, which is what you want,
# but it gives you an idea of how it'd be used.
# and you run it like:
#
#     Service::LinkingWorkflow.create_job(options).tap do |job|
#       job.signal(:start)
#     end


class ManageIQ::Providers::Autosde::StorageManager::EmsRefreshWorkflow < ManageIQ::Providers::EmsRefreshWorkflow
  def mio
    puts "AAAAAAAAAAAAAAAAAAA"
  end


  def poll_native_task
    puts "ADRIAN poll_native_task"

    status = job.options[:ems].autosde_client.JobApi.jobs_pk_get(task_id).status
    if status == "FAILURE"
      queue_signal(:abort)
    end
    if status == "SUCCESS"
      queue_signal(:post_refresh)
    end
  end

  def post_refresh
    _log.info("ADRIAN post_refresh")

    job.options[:method_post]
    queue_signal(:finish)
    end
end