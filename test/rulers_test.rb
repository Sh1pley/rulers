require_relative "test_helper"

class RulersTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Rulers::VERSION
  end
end