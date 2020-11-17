require_relative "../24contact/contact"

class Agenda
  attr_reader :filename, :contacts

  def initialize(filename)
    @filename = filename
    @contacts = load_contacts
  end

  def add(name, email)
    name.match(/\w+/) && email.match(/\A[\w.+-]+@\w+\.\w+\z/) && @contacts.push(Contact.new(name, email))
  end

  def save
    text = ""
    @contacts.each do |contact|
      text += "#{contact.name},#{contact.email}\n"
    end
    File.write(filename, text, mode: "w")
  end

  def filter(field, term)
    @filter_contacts = []
    @filter_contacts = case field
                       when "name" then filter_name(term)
                       when "email" then filter_email(term)
                       end
  end

  private

  def load_contacts
    if File.exist?(@filename)
      contacts = []
      File.read(filename).split("\n").each do |item|
        contact_arr = item.split(",")
        contacts.push(Contact.new(contact_arr[0], contact_arr[1]))
      end
      contacts
    else
      File.write(@filename, nil, mode: "w")
    end
  end

  def filter_name(term)
    @contacts.select { |contact| contact.name.match(/#{term}/) }
  end

  def filter_email(term)
    @contacts.select { |contact| contact.email.match(/#{term}/) }
  end
end
