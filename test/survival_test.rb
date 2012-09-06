require 'test_helper'

class SurvivalTest < ActiveSupport::TestCase
  test 'test kaplan meier' do
    assert_equal 45.4, Survival.km
  end
end