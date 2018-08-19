require 'test_helper'

class PlanterControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get planter_new_url
    assert_response :success
  end

end
