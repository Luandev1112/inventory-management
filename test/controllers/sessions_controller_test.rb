require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get login_url
    assert_response :success
  end

  test "should get logout" do
    delete logout_url
    assert_redirected_to root_url
    #follow_redirect!
  end

end
