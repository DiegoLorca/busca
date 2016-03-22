require 'test_helper'

class LocalizacionControllerTest < ActionController::TestCase
  test "should get position" do
    get :position
    assert_response :success
  end

end
