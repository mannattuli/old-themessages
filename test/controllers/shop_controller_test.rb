require "test_helper"

class ShopControllerTest < ActionDispatch::IntegrationTest
  test "should get yellow" do
    get shop_yellow_url
    assert_response :success
  end
end
