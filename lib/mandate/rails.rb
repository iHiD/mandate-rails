require "mandate"
require_relative "rails/version"

module MandateRails
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "./rails/railtie" if defined?(Rails::Railtie)