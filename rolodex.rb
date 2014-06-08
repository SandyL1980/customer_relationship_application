class Rolodex 

  def initialize
    @contacts = []
    @contact_id = 0
  end

  
  #method to store new contact in db, create a new id and increment the number of contact in db
  def add_contact(contact)
    @contacts << contact
    contact.id = @contact_id
    @contact_id += 1
  end

end
