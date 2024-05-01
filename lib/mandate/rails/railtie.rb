module MandateRails
  class Railtie < Rails::Railtie
    initializer "mandate_rails.configure_rails_initialization" do
      require_relative './active_job_queuer'
    end
  end
end