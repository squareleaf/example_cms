require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_url
    assert_response :success
  end
end
