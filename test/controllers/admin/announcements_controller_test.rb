require "test_helper"

class Admin::AnnouncementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_announcements_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_announcements_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_announcements_edit_url
    assert_response :success
  end
end
