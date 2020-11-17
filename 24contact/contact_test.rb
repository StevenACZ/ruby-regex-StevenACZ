require_relative "../lib/io_test_helpers"
require "minitest/autorun"
require_relative "contact"

class ContactTest < Minitest::Test

  def test_can_create_contact
    # skip
    contact = Contact.new("John Doe", "john@mail.com")
    assert_instance_of(Contact, contact)
  end

  def test_contact_remember_they_name_and_email
    # skip
    contact = Contact.new("John Doe", "john@mail.com")
    assert_equal "John Doe", contact.name
    assert_equal "john@mail.com", contact.email
  end

  def test_contact_return_string_representation_with_to_s
    # skip
    contact = Contact.new("John Doe", "john@mail.com")
    assert_equal "John Doe,john@mail.com", contact.to_s
  end
end