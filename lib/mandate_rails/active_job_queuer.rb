require_relative "./mandate_job"
  module Mandate
    module ActiveJobQueuer
      def self.extended(base)
        class << base
          def queue_as(queue)
            @active_job_queue = queue
          end
  
          def active_job_queue
            @active_job_queue || :default
          end
        end
      end
  
      def defer(*args, wait: nil, **kwargs)
        # We need to convert the jobs to a hash before we serialize as there's no serialization
        # format for a job. We do this here to avoid cluttering the codebase with this logic.
        if (prereqs = kwargs.delete(:prereq_jobs))
          prereqs.map! do |job|
            {
              job_id: job.provider_job_id,
              queue_name: job.queue_name
            }
          end
          kwargs[:prereq_jobs] = prereqs if prereqs.present?
        end
  
        MandateJob.set(
          queue: active_job_queue,
          wait:
        ).perform_later(self.name, *args, **kwargs)
      end
    end
  
    def self.included(base)
      # Upstream
      base.extend(Memoize)
      base.extend(CallInjector)
      base.extend(InitializerInjector)
  
      # New
      base.extend(ActiveJobQueuer)
    end
  end