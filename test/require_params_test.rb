require 'test_helper'

class RequireParams::Test < ActionDispatch::IntegrationTest
  test "request should be successful if all the required params are present" do
    post '/main/action_a', params: { a: 1, b: 2, c: 3 }
    assert_response :no_content
  end

  test "request should fail if some of the required params are missing" do
    post '/main/action_a', params: { a: 1, b: 2 }
    assert_response :bad_request
  end
end
