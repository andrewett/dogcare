require 'test_helper'

class EmployeeControllerTest < ActionDispatch::IntegrationTest
  test "should get user_index" do
    get employee_user_index_url
    assert_response :success
  end

end
