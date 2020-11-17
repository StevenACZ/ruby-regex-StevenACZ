class Contact
  attr_reader :name, :email

  def initialize(name, email)
    @name = name
    @email = email
  end

  def to_s
    "#{name},#{email}"
  end
end

# contacto = Contact.new("John Doe", "john@mail.com")
# p contacto.name
# p contacto.email
# p contacto.to_s
