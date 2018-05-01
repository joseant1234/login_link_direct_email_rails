require 'test_helper'

class EmailLinksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get email_links_new_url
    assert_response :success
  end

  test "should get create" do
    get email_links_create_url
    assert_response :success
  end

end
