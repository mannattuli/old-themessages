require "test_helper"

class AsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @a = as(:one)
  end

  test "should get index" do
    get as_url
    assert_response :success
  end

  test "should get new" do
    get new_a_url
    assert_response :success
  end

  test "should create a" do
    assert_difference('A.count') do
      post as_url, params: { a: { body: @a.body, image: @a.image, subject: @a.subject } }
    end

    assert_redirected_to a_url(A.last)
  end

  test "should show a" do
    get a_url(@a)
    assert_response :success
  end

  test "should get edit" do
    get edit_a_url(@a)
    assert_response :success
  end

  test "should update a" do
    patch a_url(@a), params: { a: { body: @a.body, image: @a.image, subject: @a.subject } }
    assert_redirected_to a_url(@a)
  end

  test "should destroy a" do
    assert_difference('A.count', -1) do
      delete a_url(@a)
    end

    assert_redirected_to as_url
  end
end
