require "mandate"
require_relative "mandate_rails/version"

module MandateRails
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "./mandate_rails/railtie" if defined?(Rails::Railtie)