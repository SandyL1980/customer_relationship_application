

class Rolodex 
 
  attr_accessor :id, :name, :first_name, :last_name, :email, :note
  

   @contacts = []
   @contact_id = 100
   # @rolodex = Rolodex.new

   # def initialize
   # end



  def self.run
  #to return to main menu. not successful
  back_menu = CRM.main_menu
  puts back_menu
  end

  
  #method to store new contact in db, create a new id and increment the number of contact in db
  # def add_contact(contact)
  #   @contacts << contact
  #   contact.id = @contact_id
  #   @contact_id += 1
  # end


  def self.add

    print "Enter First Name: "
    first_name = gets.chomp.capitalize!


    print "Enter Last Name: "
    last_name = gets.chomp.capitalize!


    print "Enter Email Address: "
    email = gets.chomp

    print "Enter Notes: "
    note = gets.chomp

    puts "Thank You - You have entered: "
    puts "- #{first_name}"
    puts "- #{last_name}"
    puts "- #{email}"
    puts "- #{note}"



    #creation of new instance of Contact 
    contact = Contact.new(first_name, last_name, email, note)
    @contacts << contact
    contact.id = @contact_id
    @contact_id += 1


    #asking rolodex to add a new contact in db
    # @rolodex.add_contact(contact)

     

    #how to go back to main menu once done
    #instead using this - although this is not gonna replace the previous entry - will just add new contact to Rolodex

    puts "Do you confirm? "
    puts "[1] yes"
    puts "[2] no"
    confirm_selection = gets.chomp.to_i
    
    case confirm_selection
    when 1 then main_menu
    when 2 then add_new_contact
    else
      puts 'wrong entry'
    end 

  end

 


  def self.modify_contact

    print "Enter Id:"
    id = gets.chomp 

    print "Enter First Name to modify: "
    first_name = gets.chomp.capitalize!


    print "Enter Last Name to modify: "
    last_name = gets.chomp.capitalize!

    puts "You want to modify contact: "
    puts "#{last_name}, #{first_name}"

    puts "Do you confirm?"
    puts "[1] yes"
    puts "[2] no"
    confirm_entry = gets.chomp.to_i
    confirm_modify(confirm_entry)
    
  end

  def self.confirm_modify(confirm_entry)

    case confirm_entry
    when 1 then Rolodex.run
    when 2 then modify_contact
    else
      puts 'wrong entry'
    end
  end

  def self.modify_contact

   

    puts "Enter New First Name: "
    first_name = gets.chomp.capitalize!


    puts "Enter New Last Name: "
    last_name = gets.chomp.capitalize!

    puts "Enter New Email Address: "
    email = gets.chomp

    puts "You have successfully modified existing contact:"
    puts "#{last_name}, #{first_name}(id: )"
    puts "Email address: #{email}"

  end


  def display_particular_contact
    
  end

  def self.display_all_contacts
     
      puts  "There are #{@contact_id} existing contacts in the database"
     
      @contacts.each do |x|
        # x.display_contact

        puts "#{@first_name} #{@last_name}"
        puts x.email
        puts x.note
        puts x.id
        puts ""
      end

  end


  def self.display_info_by_attribute
    puts "Select an attribute:"
      puts "[1] First name"
      puts "[2] Last name"
      puts "[3] Email address"
      puts "[4] Note"
      puts "[5] Id"

      attribute_selection = gets.chomp.to_i

      @contacts.each do |x|
        case attribute_selection
        when 1
          puts x.first_name
          puts ""
        when 2
          puts x.last_name
          puts ""
        when 3
          puts x.email
          puts ""
        when 4
          puts x.note
          puts ""
        when 5
          puts x.idd
          puts ""
        end
       end  
  end

  def self.delete_existing_contact
    puts "Select a contact to delete:"
    # contact_options

    to_delete = gets.chomp
    @contacts.delete_at(to_delete.to_i - 1)
    puts "Contact deleted"
  end
end