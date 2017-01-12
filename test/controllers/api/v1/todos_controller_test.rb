require 'test_helper'

class Api::V1::TodosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_todos_index_url
    assert_response :success
  end

end
