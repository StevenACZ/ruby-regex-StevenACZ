require_relative "../lib/io_test_helpers"
require "minitest/autorun"
require_relative "agenda"

class AgendaTest < Minitest::Test

  def test_can_create_agenda
    # skip
    agenda = Agenda.new("agenda.txt")
    assert_instance_of(Agenda, agenda)
  end

  def test_agenda_remember_its_filename
    # skip
    agenda = Agenda.new("agenda.txt")
    assert_equal "agenda.txt", agenda.filename
  end

  def test_agenda_load_contact_info_from_file
    # skip
    contacts = "John Doe,john@mail.com\nSome Guy,some@mail.co\n"
    File.open("agenda.txt", "w") { |file| file.write(contacts) }
    agenda = Agenda.new("agenda.txt")
    assert_equal agenda.contacts.size, 2
    assert_equal agenda.contacts[0].to_s, "John Doe,john@mail.com"
    assert_equal agenda.contacts[1].to_s, "Some Guy,some@mail.co"
  end

  def test_agenda_add_valid_contact
    # skip
    agenda = Agenda.new("agenda.txt")
    agenda.add("New Guy", "new@mail.com")
    assert_equal agenda.contacts.last.name, "New Guy"
    assert_equal agenda.contacts.last.email, "new@mail.com"
  end

  def test_agenda_return_nil_when_adding_invalid_contact
    # skip
    agenda = Agenda.new("agenda.txt")
    assert_nil agenda.add("", "new@mail.com")
    assert_nil agenda.add("New Guy", "mail.com")
  end

  def test_agenda_filter_contacts
    # skip
    contacts = "John Doe,john@mail.com\nSome Guy,some@mail.co\n"
    File.open("agenda.txt", "w") { |file| file.write(contacts) }
    agenda = Agenda.new("agenda.txt")
    assert_equal agenda.filter("name", "Doe").size, 1
    assert_equal agenda.filter("name", "Diego").size, 0
    assert_equal agenda.filter("email", "@mail").size, 2
  end

  def test_agenda_save_contacts_on_file
    # skip
    contacts = "John Doe,john@mail.com\nSome Guy,some@mail.co\n"
    File.open("agenda.txt", "w") { |file| file.write(contacts) }
    agenda = Agenda.new("agenda.txt")
    agenda.add("New Guy", "new@mail.com")
    agenda.save
    assert_equal File.open("agenda.txt").each_line.to_a.last, "New Guy,new@mail.com\n"
  end
end