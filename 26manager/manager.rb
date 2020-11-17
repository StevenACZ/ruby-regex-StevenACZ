require_relative "../25agenda/agenda"

class AgendaManager
  def initialize(filename)
    @agenda = Agenda.new(filename)
  end

  def start
    # your code here
  end

  private

  def menu
    # your code here
  end
end

filename = ARGV.shift
manager = AgendaManager.new(filename)
manager.start
