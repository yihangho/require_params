require 'test_helper'
require 'json'

class RequireParams::Test < ActionDispatch::IntegrationTest
  test "request should be successful if all the required params are present" do
    post '/main/action_a', params: { a: 1, b: 2, c: 3 }
    assert_response :no_content
  end

  test "request should fail if some of the required params are missing with correct error hash" do
    post '/main/action_a', params: { a: 1, b: 2 }
    assert_response :bad_request
    assert_equal({"errors" => {"c" => ["is missing"]}}, JSON.parse(@response.body))
  end

  test "before_action callbacks should not be called" do
    post '/main/action_c'
    assert_response :bad_request
  end

  test "failure from different calls to require_params should all be reported" do
    post '/complex/action'
    assert_response :bad_request
    reported_missing_params = JSON.parse(@response.body)["errors"].keys.sort
    assert_equal %w(a c d f), reported_missing_params
  end
end
