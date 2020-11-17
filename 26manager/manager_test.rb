$LOAD_PATH.unshift("./26manager")

require_relative "../lib/io_test_helpers"
require "minitest/autorun"

class AgendaManagerTest < Minitest::Test
  include IoTestHelpers

  def test_print_menu_with_filename_on_the_title
    # skip
    ARGV.clear
    input = ["exit"]
    output, _error = capture_io do
      simulate_stdin(*input) do
        ARGV.concat ["agenda.txt"]
        load "manager.rb"
      end
    end

    assert_match "agenda.txt", output
  end

  def test_list_contacts
    # skip
    ARGV.clear
    contacts = "John Doe,john@mail.com\nSome Guy,some@mail.co\n"
    File.open("agenda.txt", "w") { |file| file.write(contacts) }
    input = ["list", "exit"]
    output, _error = capture_io do
      simulate_stdin(*input) do
        ARGV.concat ["agenda.txt"]
        load "manager.rb"
      end
    end

    assert_match "John Doe,john@mail.com\nSome Guy,some@mail.co\n", output
  end

  def test_add_valid_contact
    # skip
    ARGV.clear
    contacts = "John Doe,john@mail.com\nSome Guy,some@mail.co\n"
    File.open("agenda.txt", "w") { |file| file.write(contacts) }
    input = ["add", "New Contact", "new@mail.co", "list", "exit"]
    output, _error = capture_io do
      simulate_stdin(*input) do
        ARGV.concat ["agenda.txt"]
        load "manager.rb"
      end
    end

    assert_match  "John Doe,john@mail.com\nSome Guy,some@mail.co\nNew Contact,new@mail.co\n",
                  output
  end

  def test_add_invalid_contact
    # skip
    ARGV.clear
    contacts = "John Doe,john@mail.com\nSome Guy,some@mail.co\n"
    File.open("agenda.txt", "w") { |file| file.write(contacts) }
    input = ["add", "New Contact", "mail.co", "exit"]
    output, _error = capture_io do
      simulate_stdin(*input) do
        ARGV.concat ["agenda.txt"]
        load "manager.rb"
      end
    end

    assert_match  "Failed", output
  end

  def test_save_changes
    # skip
    ARGV.clear
    contacts = "John Doe,john@mail.com\nSome Guy,some@mail.co\n"
    File.open("agenda.txt", "w") { |file| file.write(contacts) }
    input = ["add", "New Contact", "new@mail.co", "save", "exit"]
    _output, _error = capture_io do
      simulate_stdin(*input) do
        ARGV.concat ["agenda.txt"]
        load "manager.rb"
      end
    end

    assert_equal File.open("agenda.txt").each_line.to_a.last, "New Contact,new@mail.co\n"
  end

  def test_search
    # skip
    ARGV.clear
    contacts = "John Doe,john@mail.com\nSome Guy,some@mail.co\n"
    File.open("agenda.txt", "w") { |file| file.write(contacts) }
    input = ["search", "name", "John", "exit"]
    output, _error = capture_io do
      simulate_stdin(*input) do
        ARGV.concat ["agenda.txt"]
        load "manager.rb"
      end
    end

    assert_match  "John Doe,john@mail.com\n", output
    refute_match  "Some Guy,some@mail.co\n", output
  end
end