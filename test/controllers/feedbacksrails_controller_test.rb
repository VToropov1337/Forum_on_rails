require 'test_helper'

class FeedbacksrailsControllerTest < ActionDispatch::IntegrationTest
  test "should get routes" do
    get feedbacksrails_routes_url
    assert_response :success
  end

end
