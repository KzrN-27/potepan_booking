require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get rooms_top_url
    assert_response :success
  end

end
