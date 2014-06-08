=begin
	
Implement the Runner

As a user, I am presented with a prompt to 'add', 'modify', 'display all', 'display contact', display attribute', 'delete' and 'exit'.
As a user, if 'add' is typed, I am prompted to give my 'first name', 'last name', 'email' and 'notes'.
As a user, if 'modify' is typed, I am prompted to enter a contact attribute to be modified.
As a user, when an attribute is entered, I am prompted to type 'yes' or 'no' to confirm my selection.
As a user, if 'yes' is typed, I am prompted to change 'id', 'firstname', 'lastname' and 'email'.
As a user, when an attribute is entered, I am prompted to enter a new value for the attribute.
As a user, if 'no' is typed, I am returned back to the main menu.
As a user, if 'display all' is typed, I am shown all of the contacts that exist.
As a user, if 'display contact' is typed, I am shown a particular contact.
As a user, if 'display attribute' is typed, I am prompted to enter an attribute so that I can see all of the contacts according to that attribute.
As a user, if 'delete' is typed, I am prompted to enter an attribute value of the contact to be deleted.
As a user, if 'exit' is typed, I am exited out of the program and returned to the command line.
Implement the Contact Class

As a developer, the contact class should have five attributes: id, first_name, last_name, email and notes.
As a developer, when a user creates a contact, all five attributes are mandatory.
As a developer, I am able to modify those attributes at any point in the program at a later time.
As a developer, the Contact class should also have a method that displays all of its values.
Implement the Rolodex Class

As a developer, I should implement the Rolodex class as an array that accepts new contacts.
As a developer, the rolodex class should have the following methods: add, modify_contact, display_all_contacts, display_particular_contact, display_info_by_attribute and delete_contact.
Tips

DOING 

As a user, I am presented with a prompt to 'add', 'modify', 'display all', 'display contact', display attribute', 'delete' and 'exit'.
As a user, if 'add' is typed, I am prompted to give my 'first name', 'last name', 'email' and 'notes'.
As a user, if 'modify' is typed, I am prompted to enter a contact attribute to be modified.
As a user, when an attribute is entered, I am prompted to type 'yes' or 'no' to confirm my selection.
As a user, if 'yes' is typed, I am prompted to change 'id', 'firstname', 'lastname' and 'email'.
As a user, when an attribute is entered, I am prompted to enter a new value for the attribute.
As a user, if 'no' is typed, I am returned back to the main menu.
As a user, if 'display all' is typed, I am shown all of the contacts that exist.
As a user, if 'display contact' is typed, I am shown a particular contact.
As a user, if 'display attribute' is typed, I am prompted to enter an attribute so that I can see all of the contacts according to that attribute.
As a user, if 'delete' is typed, I am prompted to enter an attribute value of the contact to be deleted.
As a user, if 'exit' is typed, I am exited out of the program and returned to the command line.

DONE



	
=end


class CRM

	attr_reader :name, :first_name, :last_name, :email, :note


	def initialize(name)
		@name = name
		puts "Welcome to the #{name} CRM"
		@rolodex = Rolodex.new
	end

	def print_main_menu
	  puts "[1] Type 'add' to add a new contact"
	  puts "[2] Type 'modify' to modify an existing contact"
	  puts "[3] Type 'display contact' to display an existing contact"
	  puts "[4] Type 'display all' to display all existing contacts"
	  puts "[5] Type 'display attribute' to display contacts with that an attribute"
	  puts "[6] Type 'delete' to delete an existing contact"
	  puts "[6] Type 'exit' to exit application"
	  puts "Type a selection: "
	end

		
	def main_menu
		print_main_menu
		user_selection = gets.chomp
		call_option(user_selection)

	end

	def call_option(selection)

		case(selection)
		when 'add' then add_new_contact
		when 'modify' then modify_existing_contact
		when 'display contact' then display_existing_contact
		when 'display all' then display_all_existing_contacts
		when 'display attribute' then display_existing_contact_with_attribute
		when 'delete' then delete_existing_contact
		when 'exit' then main_menu
		else 
			puts 'Invalid Selection, please try again' 
			main_menu
		end

	end

	def add_new_contact

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
		@rolodex.add_contact(contact)

		#how to go back to main menu once done
		#instead using this - although this is not gonna replace the previous entry - will just add new contact to Rolodex

		puts "Do you confirm?"
		puts "Type 'yes' to go back to main menu or 'no' to start over"
		confirm_add = gets.chomp
		confirm_add(confirm_add)


	end

	def confirm_add(confirm_add)

		case confirm_add
		when 'yes' then main_menu
		when 'no'  then add_new_contact
		else
			puts 'wrong entry'
		end
	end

	def modify_existing_contact
		print "Enter First Name to modify: "
		first_name = gets.chomp.capitalize!


		print "Enter Last Name to modify: "
		last_name = gets.chomp.capitalize!

		puts "You want to modify contact: "
		puts "#{last_name}, #{first_name}"
		puts "Do you confirm?"
		puts "Type 'yes' to continue or 'no' to start over"
		confirm = gets.chomp
		confirm_modify(confirm_modify)
		

	end

	def confirm_modify(confirm_modify)

		case confirm_modify
		when 'yes' then modify_contact
		when 'no'  then main_menu
		else
			puts 'wrong entry'
		end
	end

	def modify_contact

		puts"Enter Id:"
		id = gets.chomp	

		puts "Enter New First Name: "
		first_name = gets.chomp.capitalize!


		puts "Enter New Last Name: "
		last_name = gets.chomp.capitalize!

		puts "Enter New Email Address: "
		email = gets.chomp

		puts "You have successfully modify existing contact:"
		puts "#{last_name}, #{first_name}(id: )"
		puts "Email address: #{email}"

	end

end #end class CRM

class Contact < CRM

  attr_accessor :id, :name, :first_name, :last_name, :email, :note

  #All attributes are available inside the entire CRM program
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email 
    @note = note
  end

end


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


crm = CRM.new("Bitmaker Labs")
crm.main_menu