require 'test_helper'

class IphoneControllerTest < ActionController::TestCase
  test "should get listen" do
    get :listen
    assert_response :success
  end

end
