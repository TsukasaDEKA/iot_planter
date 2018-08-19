require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get user_add_url
    assert_response :success
  end

end
