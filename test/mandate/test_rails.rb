# frozen_string_literal: true

require "test_helper"

class Mandate::TestRails < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::MandateRails::VERSION
  end
end
