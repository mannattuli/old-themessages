require "test_helper"

class UControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get u_show_url
    assert_response :success
  end
end
