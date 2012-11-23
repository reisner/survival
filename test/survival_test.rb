require 'test_helper'

class SurvivalTest < ActiveSupport::TestCase

  @@survivals = [{:event => 3, :censored => false}, {:event => 4, :censored => true}]

  test 'km plot' do
    p = KaplanMeier.generate_plot_points(SurvivalSample.create_survival_objects(@@survivals))
    assert_equal [[0, 100], [3, 100], [3, 100.0], [4, 100.0], [4, 0.0]], p
  end

  test 'survival_sample array' do
    assert_equal 2, SurvivalSample.create_survival_objects(@@survivals).length
  end

  test 'survival_sample new' do
    assert_equal false, SurvivalSample.new(false, 34).censored
    assert_equal 34, SurvivalSample.new(false, 34).event
  end

end