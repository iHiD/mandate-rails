# frozen_string_literal: true

require "mandate"
require_relative "rails/version"

module Mandate
  module Rails
    class Error < StandardError; end
    # Your code goes here...
  end
end

require_relative "./rails/railtie" if defined?(Rails::Railtie)