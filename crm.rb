require_relative 'contact'
require_relative 'rolodex'

class CRM

	attr_reader :name, :first_name, :last_name, :email, :note


	def initialize(name)
		@name = name
		puts "Welcome to the #{name} CRM"
		@rolodex = Rolodex.new
	end

	def self.run(name)
	    crm = CRM.new(name)
	    crm.main_menu
    end

	def print_main_menu
	  puts "#{name} CRM - Main Menu"
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

		puts "You have successfully modified existing contact:"
		puts "#{last_name}, #{first_name}(id: )"
		puts "Email address: #{email}"

	end

	def display_all_existing_contacts

		puts @contacts
		puts "There are #{@contact_id} existing contacts"

	end

end #end class CRM





crm = CRM.run("Bitmaker Labs")
puts crm
