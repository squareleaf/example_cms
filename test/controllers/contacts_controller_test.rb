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

  test "should get edit"
    get edit_contact_url(one)
    assert_response :success
  end

  test "should update birthday"
    contact = contacts(:two)
    new_birthday = "2/10/1976"

    patch :update, contact: { id: contact.id, birthday: new_birthday }

    assert_equal new_birthday, contact.birthday
  end
end
