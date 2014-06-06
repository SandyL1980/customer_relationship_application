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
	
=end

def print_main_menu
  puts "[1] Type 'add' to add a new product"
  puts "[2] Type 'modify' to modify contact"
  puts "[3] Type 'delete' to delete a contact"
  puts "[4] Type 'display contact' to a contact"
  puts "[5] Type 'display attribute' to display an attribute"
  puts "[6] Type 'exit' to exit"
  puts "Enter your selection: "
  
end


def main_menu
	print_main_menu
	user_selected = gets.chomp
    option(user_selected)
end



def option (user_selected)


	user_selection = case user_selected
	when 'add' then  add_new_contact
	when 'modify' then modify_contact
	when 'delete' then delete_contact
	when 'display contact' then display_contact
	when 'display attribute'  then display_attribute
	when 'exit' then puts 'exit' 
	else
		puts "Invalid selection"
		main_menu
	end

	return user_selection
end


# def yes_no(user_input)
# 	case user_input
# 	 when 'yes' then main_menu
# 	 when 'no' then main_menu
# 	end 

# end


def add_new_contact
		print "Enter First Name:"
		first_name = gets.chomp
		first_name.capitalize!

		print "Enter Last Name:"
		last_name = gets.chomp
		last_name.capitalize!

		print "Enter Email Address: "
		email = gets.chomp

		print "Enter Note:"
		note = gets.chomp

		puts "You have entered #{first_name} #{last_name}"
		puts "#{email}"
		puts "#{note}"


		#initialize the instance of the Contact Class
		# @rolodex.add_contact(Contact.new(first_name,last_name,email,note))
	end

def modify_contact
		print "Enter contact to modify: "
		first_name =  gets.chomp
		first_name.capitalize!

		print "Enter Last name: "
		last_name =  gets.chomp
		last_name.capitalize!

		puts "You want to modify contact: #{first_name} #{last_name}"
		puts "Do you confirm the above selection - Enter 'yes' or 'no'"
		user_confirm = gets.chomp
		confirm(user_confirm)

end

def confirm(user_confirm)
	case user_confirm
	 when 'yes' then modify_attribute
	 when 'no' then main_menu
	end 

end

def modify_attribute
		print "Enter new contact: "
		first_name =  gets.chomp
		first_name.capitalize!

		print "Enter new last name: "
		last_name =  gets.chomp
		last_name.capitalize!

		puts "You have successfully modified attribute to #{first_name} #{last_name}"
	
end

def delete_contact
		print "Enter contact to delete: "
		first_name =  gets.chomp
		first_name.capitalize!

		print "Enter Last name: "
		last_name =  gets.chomp
		last_name.capitalize!

		puts "You want to delete contact: #{first_name} #{last_name}"
	
end

def display_contact
		print "Enter contact to display: "
		first_name =  gets.chomp
		first_name.capitalize!

		print "Enter Last name: "
		last_name =  gets.chomp
		last_name.capitalize!

		puts "You want to display contact: #{first_name} #{last_name}"
	
end





#to call the main_menu method
#place at the bottom - better !
main_menu
