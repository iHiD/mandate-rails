require "mandate"

module MandateRails
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "./mandate-rails/railtie" if defined?(Rails::Railtie)