require "test_helper"

class V1::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get v1_users_index_url
    assert_response :success
  end

  test "should get create" do
    get v1_users_create_url
    assert_response :success
  end

  test "should get new" do
    get v1_users_new_url
    assert_response :success
  end

  test "should get destroy" do
    get v1_users_destroy_url
    assert_response :success
  end

  test "should get show" do
    get v1_users_show_url
    assert_response :success
  end
end
