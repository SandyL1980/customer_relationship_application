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
		when 'add' then Rolodex.add
		when 'modify' then  Rolodex.modify_contact
		when 'display contact' then  Rolodex.display_particular_contact
		when 'display all' then  Rolodex.display_all_contacts
		when 'display attribute' then Rolodex.display_info_by_attribute
		when 'delete' then  Rolodex.delete_existing_contact
		when 'exit' then main_menu
		else 
			puts 'Invalid Selection, please try again' 
			main_menu
		end

	end

		


end #end class CRM





crm = CRM.run("Bitmaker Labs")
puts crm
