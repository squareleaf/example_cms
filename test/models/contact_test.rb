require 'test_helper'

class ContactTest < ActiveSupport::TestCase

  setup do
    @test_contact = Contact.find_by_name 'Ned Nederlander'
  end

  test "it should have a name" do
    new_contact = Contact.new name: nil,
                              email: 'test@fbsdata.com',
                              phone: '123-456-7890'
    assert !new_contact.valid?
  end

  test "it should have a unique name/email combo" do
    new_contact = Contact.new name: @test_contact.name,
                              email: @test_contact.email,
                              phone: '123-456-7890'
    assert !new_contact.valid?
  end

  test "it should have a properly formatted phone number" do
    new_contact = Contact.new name: "Bob Loblaw",
                              email: "bob@loblaw.com",
                              phone: '7632'
    assert !new_contact.valid?
  end
end
