require 'test_helper'

class ContUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cont_users_new_url
    assert_response :success
  end

  test "should get create" do
    get cont_users_create_url
    assert_response :success
  end

end
