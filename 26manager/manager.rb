require_relative "../25agenda/agenda"

class AgendaManager
  def initialize(filename)
    @agenda = Agenda.new(filename)
  end

  def start
    until menu
      option = gets.chomp
      case option
      when "list" then list
      when "add" then add
      when "save" then save
      when "search" then search
      when "exit" then break
      end
    end
  end

  private

  def menu
    puts "-----------------------#{@agenda.filename}-----------------------"
    puts "1. list     2. add      3. save     4. search   5. exit"
  end

  def list
    @agenda.contacts.each do |contact|
      puts "#{contact.name},#{contact.email}"
    end
  end

  def add
    print "Name: "
    name = gets.chomp
    print "Email: "
    email = gets.chomp
    if @agenda.add(name, email).nil?
      puts "Failed"
    else
      puts "Contact added"
    end
  end

  def save
    @agenda.save
  end

  def search
    print "Field: "
    field = gets.chomp
    print "Search term: "
    term = gets.chomp
    @agenda.filter(field, term).each do |contact|
      puts "#{contact.name},#{contact.email}"
    end
  end
end

filename = ARGV.shift
manager = AgendaManager.new(filename)
manager.start
